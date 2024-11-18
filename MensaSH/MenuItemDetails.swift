//
//  MenuItemDetails.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct MenuItemDetails: View {
    var menuItem: MenuOfTheDay.MenuItem
    var abbreviations: [String: Ingredient]
    
    var body: some View {
        List {
            Text(menuItem.fullDescription)
            LabeledContent("Day") {
                Text(menuItem.date, format: .dateTime.year().month().day().weekday())
            }
            LabeledContent("Types", value: menuItem.types.isEmpty ? "—" : menuItem.types.map { abbreviations[$0]?.name ?? $0 }.joined(separator: ", "))
            
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
            
            MenuItemAbbreviationList(label: "Allergens", list: menuItem.allergens, abbreviations: abbreviations)
            MenuItemAbbreviationList(label: "Additives", list: menuItem.additives, abbreviations: abbreviations)
        }
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MenuItemDetails(menuItem: .init(date: .now, name: [.init(name: "Tortellini", additions: nil), .init(name: "mit Rucola", additions: nil)], allergens: [], additives: [], types: [], prices: [2.5, 3.75, 5.15]), abbreviations: [:])
    }
}
