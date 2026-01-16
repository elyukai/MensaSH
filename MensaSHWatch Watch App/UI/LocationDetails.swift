//
//  LocationDetails.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct LocationDetails: View {
    var location: Location?
    @Binding var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])]
    @Binding var ingredients: [String: Ingredient]
    @Binding var selectedMenuItem: MenuOfTheDay.Item?
    var loadMenu: ((Location) async -> Void)
    var loadIngredients: (() async -> Void)
    @State private var week: MensaParser.Week = .current
    @State private var showFilters: Bool = false
    
    var selectedMenu: MenuOfTheDay? {
        if let location, let menu = menusByLocation[location] {
            return menu.current.first(where: { dayMenu in
                dayMenu.date >= Calendar.current.startOfDay(for: .now)
            })
        } else {
            return nil
        }
    }
    
    var body: some View {
        if let location {
            List {
                if let menu = selectedMenu {
                    ForEach(menu.announcements, id: \.self) { announcement in
                        AnnouncementRow(text: announcement)
                    }
                    
                    ForEach(menu.items) { menuItem in
                        MenuItemRow(menuItem: menuItem)
                    }
                    
                    if menu.announcements.isEmpty && menu.items.isEmpty {
                        Text("No menu item matches your filters")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .refreshable {
                await loadMenu(location)
                await loadIngredients()
            }
            .onChange(of: location) {
                Task {
                    await loadMenu(location)
                }
            }
            .task {
                await loadMenu(location)
            }
            .overlay {
                listOverlay
            }
            .navigationTitle(location.rawValues.1.description)
        } else {
            ContentUnavailableView("No location selected", systemImage: "location")
        }
    }
    
    var listOverlay: some View {
        Group {
            if selectedMenu == nil {
                ContentUnavailableView {
                    ProgressView("Loading…")
                }
#if os(iOS)
                .background(Color(UIColor.systemGroupedBackground))
#endif
//            } else if selectedMenu.isEmpty {
//                ContentUnavailableView {
//                    Text("No menu items")
//                }
//#if os(iOS)
//                .background(Color(UIColor.systemGroupedBackground))
//#endif
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedMenuItem: MenuOfTheDay.Item? = nil
    
    LocationDetails(location: .flensburg(.mensa), menusByLocation: .constant([:]), ingredients: .constant([:]), selectedMenuItem: $selectedMenuItem, loadMenu: { _ in Task { } }, loadIngredients: { Task { } })
}
