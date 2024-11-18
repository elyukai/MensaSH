//
//  MenuList.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct ForEachMenu: View {
    var menu: [MenuOfTheDay]?
    
    var body: some View {
        ForEach(menu ?? []) { day in
            Section(day.date.formatted(.dateTime.year().month().day().weekday())) {
                ForEach(day.announcements, id: \.self) { announcement in
                    Label {
                        Text(announcement)
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "exclamationmark.triangle")
                    }
                    .listItemTint(.orange)
                }
                
                ForEach(day.menu) { menuItem in
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
                
                if day.announcements.isEmpty && day.menu.isEmpty {
                    Text("No menu item matches your filters")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    List {
        ForEachMenu()
    }
}
