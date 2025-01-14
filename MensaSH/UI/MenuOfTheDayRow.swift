//
//  MenuItemRow.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct MenuOfTheDayRow: View {
    var menu: MenuOfTheDay
    
    var body: some View {
        Section(menu.date.formatted(.dateTime.year().month().day().weekday())) {
            ForEach(menu.announcements, id: \.self) { announcement in
                AnnouncementRow(text: announcement)
            }
            
            ForEach(menu.menu) { menuItem in
                MenuItemRow(menuItem: menuItem)
            }
            
            if menu.announcements.isEmpty && menu.menu.isEmpty {
                Text("No menu item matches your filters")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    List {
        MenuOfTheDayRow(menu: .init(date: .now, menu: [
            .init(date: .now, name: [.init(name: "Tortellini", additions: nil), .init(name: "mit Rucola", additions: nil)], allergens: [], additives: [], types: [], prices: [2.5, 3.75, 5.15], co2stars: 3),
            .init(date: .now, name: [.init(name: "Fischstäbchen", additions: nil), .init(name: "mit Cocktailsoße", additions: nil), .init(name: "und Pommes", additions: nil)], allergens: [], additives: [], types: [], prices: [3.75, 4.8, 6.1], co2stars: 2)
        ], announcements: []))
    }
}
