//
//  MensaParser.swift
//  MensaSH
//
//  Created by Lukas Obermann on 17.11.24.
//

import Foundation
import SwiftSoup

actor MensaParser {
    enum Week: Int {
        case current = 0, next = 1
    }
    
    enum Language: String {
        case german = "de", english = "en"
    }
    
    private func requestHTMLDocument(for location: Location, inWeek week: Week, language: Language) async throws -> Document {
        let (city, building) = await location.rawValues
        
        let baseUrl = switch language {
            case .german: "https://studentenwerk.sh/de/essen-uebersicht"
            case .english: "https://studentenwerk.sh/en/food-overview"
        }
        
        let url = URL(string: baseUrl)!.appending(queryItems: [
            URLQueryItem(name: "ort", value: city.rawValue.description),
            URLQueryItem(name: "mensa", value: building.rawValue.description),
            URLQueryItem(name: "nw", value: week.rawValue.description)
        ])
        let (data, _) = try await URLSession.shared.data(from: url)
        let html = String(data: data, encoding: .utf8)!
        let doc: Document = try SwiftSoup.parse(html)
        return doc
    }
    
    private func extractMenuItemNameParts(from element: Element) throws -> [MenuOfTheDay.Item.NamePart] {
        let nameElementChildren = try element.select(".menu_name").first()!.textNodes()
        return nameElementChildren.compactMap { textNode in
            let name = textNode.text().trimmingCharacters(in: .whitespaces)
            let additions = { () -> [String] in
                if let additionsElement = textNode.nextSibling() as? Element,
                   additionsElement.tagName() == "span",
                   let content = try? /\((.+)\)/.wholeMatch(in: additionsElement.text()) {
                    return content.output.1.split(separator: /, ?/).map { String($0) }
                } else {
                    return []
                }
            }()
            
            return MenuOfTheDay.Item.NamePart(name: name, additions: additions)
        }
    }
    
    private func extractDataSet(_ name: String, from element: Element) throws -> [String] {
        try element.attr(name).split(separator: "|").map { String($0) }
    }
    
    private func extractMenuItems(from element: Element, for date: Date) throws -> [MenuOfTheDay.Item] {
        try element.select(".mensa_menu_detail").map { menuElement in
            let nameParts = try extractMenuItemNameParts(from: menuElement)
            let allergens = try extractDataSet("data-allergene", from: menuElement)
            let additives = try extractDataSet("data-zusatzstoffe", from: menuElement)
            let types = try extractDataSet("data-arten", from: menuElement)
            
            let prices = try menuElement.select(".menu_preis").first()!.children()
                .filter { $0.tagName() == "span" }
                .map { try Decimal(try $0.text(), format: .currency(code: "EUR")) }
            
            let co2stars = Int(try menuElement.select(".co2star").first()?.attr("data-anz") ?? "")
            
            return MenuOfTheDay.Item(date: date, name: nameParts, allergens: allergens, additives: additives, types: types, prices: prices, co2stars: co2stars)
        }
    }
    
    private func extractAnnouncements(from element: Element) throws -> [String] {
        try element.select(".mensa_tagesinfo .mensa_tagesinfo_content").map { announcementElement in
            announcementElement.textNodes().map { $0.text().trimmingCharacters(in: .whitespaces) }.joined(separator: " ")
        }
    }
    
    private func extractMenu(from document: Document) throws -> [MenuOfTheDay] {
        let timeZone = TimeZone(identifier: "Europe/Berlin")!
        return try document.select(".mensatag > .tag_headline").compactMap { dayElement in
            let (_, yearStr, monthStr, dayStr) = try /(\d{4})-(\d{2})-(\d{2})/.wholeMatch(in: try dayElement.attr("data-day"))!.output
            let date = DateComponents(calendar: .current, timeZone: timeZone, year: Int(yearStr), month: Int(monthStr), day: Int(dayStr), hour: 0, minute: 0, second: 0).date!
            let menu = try extractMenuItems(from: dayElement, for: date)
            let announcements = try extractAnnouncements(from: dayElement)
            
            guard !menu.isEmpty || !announcements.isEmpty else { return nil }
            
            return MenuOfTheDay(date: date, items: menu, announcements: announcements)
        }.sorted(by: { $0.date < $1.date })
    }
    
    func readWeeklyMenu(for location: Location, inWeek week: Week, language: Language) async throws -> [MenuOfTheDay] {
        let document = try await requestHTMLDocument(for: location, inWeek: week, language: language)
        let menu = try extractMenu(from: document)
        return menu
    }
    
    func readWeeklyMenu(for location: Location, language: Language) async throws -> (current: [MenuOfTheDay], next: [MenuOfTheDay]) {
        let currentWeek = try await readWeeklyMenu(for: location, inWeek: .current, language: language)
        let nextWeek = try await readWeeklyMenu(for: location, inWeek: .next, language: language)
        return (current: currentWeek, next: nextWeek)
    }
    
    func readWeeklyMenu(language: Language) async throws -> [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] {
        var dict: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [:]
        
        for location in await Location.allCases {
            dict[location] = try await readWeeklyMenu(for: location, language: language)
        }
        
        return dict
    }
    
    func readIngredient(from button: Element) throws -> Ingredient? {
        let abbreviation = try button.attr("data-wert")
        guard let kind = Ingredient.Kind(rawValue: try button.attr("data-typ")) else { return nil }
        
        let exclude = switch try button.attr("data-ex") {
        case "0": false
        case "", "1": true
        default:
            false
        }
        
        let name = try button.children().first(where: {
            content in try content.tagName() == "span" && content.classNames().isEmpty
        })?.text() ?? abbreviation
        
        let nameWithoutExcludePrefix = name.replacing(/^((without|ohne) )/.ignoresCase(), with: "")
        
        let include = try button.attr("data-include")
        let includes: [String] = include.isEmpty ? [] : include.split(separator: "|").map { String($0) }
        
        return Ingredient(abbreviation: abbreviation, name: nameWithoutExcludePrefix, kind: kind, exclude: exclude, includes: includes)
    }
    
    func readIngredients(language: Language) async throws -> [String: Ingredient] {
        let document = try await requestHTMLDocument(for: .flensburg(.mensa), inWeek: .current, language: language)
        let filterButtons = try document.select(".mensablock_filterelemente_block .filterbutton")
        var ingredients = [String: Ingredient]()
        
        for button in filterButtons {
            if let ingredient = try? readIngredient(from: button) {
                ingredients[await ingredient.id] = ingredient
            }
        }
        
        return ingredients
    }
}
