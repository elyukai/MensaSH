//
//  MenuItemRow.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct MenuItemRow: View {
    var menuItem: MenuOfTheDay.MenuItem
    
    var body: some View {
        NavigationLink(value: menuItem) {
            if menuItem.prices.isEmpty {
                Text(menuItem.description)
                    .lineLimit(2)
            } else {
                LabeledContent(menuItem.description) {
                    Text(menuItem.hasDifferentPrices ? menuItem.prices.map { $0.formatted(.currency(code: "EUR")) }.joined(separator: " / ") : menuItem.prices[0].formatted(.currency(code: "EUR")))
                }
                .lineLimit(2)
            }
        }
    }
}

#Preview {
    List {
        MenuItemRow(menuItem: .init(date: .now, name: [.init(name: "Tortellini", additions: nil), .init(name: "mit Rucola", additions: nil)], allergens: [], additives: [], types: [], prices: [2.5, 3.75, 5.15]))
    }
}
