//
//  MenuItemDetails.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct MenuItemDetails: View {
    var menuItem: MenuOfTheDay.Item
    @Binding var ingredients: [String: Ingredient]
    
    var body: some View {
        List {
            Text(menuItem.fullDescription)
            LabeledContent("Day") {
                Text(menuItem.date, format: .dateTime.year().month().day().weekday())
            }
            LabeledContent("Types", value: menuItem.types.isEmpty ? "—" : menuItem.types.map { ingredients[$0]?.name ?? $0 }.joined(separator: ", "))
            
            LabeledContent("CO₂ Score") {
                HStack(alignment: .center, spacing: 3) {
                    if let co2stars = menuItem.co2stars {
                        ForEach(1..<4) { stars in
                            Image(systemName: co2stars >= stars ? "star.fill" : "star")
                                .foregroundStyle(.green)
                        }
                    } else {
                        ForEach(1..<4) { stars in
                            Image(systemName: "star")
                                .foregroundStyle(.placeholder)
                        }
                    }
                }
            }
            
            if !menuItem.prices.isEmpty {
                Section("Price") {
                    if menuItem.prices.count == 3 && menuItem.hasDifferentPrices {
                        LabeledContent("Students") {
                            Text(menuItem.prices[0], format: .currency(code: "EUR"))
                        }

                        LabeledContent("University Members") {
                            Text(menuItem.prices[1], format: .currency(code: "EUR"))
                        }

                        LabeledContent("Guests") {
                            Text(menuItem.prices[2], format: .currency(code: "EUR"))
                        }
                    } else {
                        LabeledContent("Everyone") {
                            Text(menuItem.prices[0], format: .currency(code: "EUR"))
                        }
                    }
                }
            }
            
            MenuItemAbbreviationList(label: "Allergens", list: menuItem.allergens, abbreviations: ingredients)
            MenuItemAbbreviationList(label: "Additives", list: menuItem.additives, abbreviations: ingredients)
        }
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MenuItemDetails(menuItem: .init(date: .now, name: [.init(name: "Tortellini", additions: []), .init(name: "mit Rucola", additions: [])], allergens: [], additives: [], types: [], prices: [2.5, 3.75, 5.15], co2stars: 2), ingredients: .constant([:]))
    }
}
