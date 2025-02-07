//
//  LocationDetails.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct LocationDetails: View {
#if os(macOS)
    @Environment(\.openWindow) private var openWindow
#endif
    @AppStorage("filters") private var filters: Set<String> = []
    var location: Location
    @Binding var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])]
    @Binding var ingredients: [String: Ingredient]
    @Binding var selectedMenuItem: MenuOfTheDay.Item?
    var loadMenu: ((Location) async -> Void)
    var loadIngredients: (() async -> Void)
    @State private var week: MensaParser.Week = .current
    @State private var showFilters: Bool = false
    
    private var extendedFilters: Set<Ingredient.ID> {
        Ingredient.extend(filters: filters, withTransitiveFiltersFrom: ingredients.values)
    }
    
    var selectedMenu: [MenuOfTheDay]? {
        if let menu = menusByLocation[location] {
            let intermediateMenu = switch week {
            case .current: menu.current
            case .next: menu.next
            }
            
            return intermediateMenu
                .filter { $0.date >= Calendar.current.startOfDay(for: .now) }
                .map { menu in
                    let filteredMenu = menu.items.filter { menuItem in
                        extendedFilters.allSatisfy { filterId in
                            guard let ingredient = ingredients[filterId] else { return true }
                            return menuItem.contains(ingredient) != ingredient.exclude
                        }
                    }
                    
                    return MenuOfTheDay(date: menu.date, items: filteredMenu, announcements: menu.announcements)
                }
        } else {
            return nil
        }
    }
    
    var body: some View {
        List(selectedMenu ?? [], selection: $selectedMenuItem) { menu in
            MenuOfTheDayRow(menu: menu)
        }
#if os(iOS)
        .listStyle(.insetGrouped)
        .listSectionSpacing(.compact)
#endif
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
#if os(macOS)
        .navigationSubtitle(subtitle)
#endif
        .toolbar {
#if os(macOS)
            ToolbarItem {
                filterButton
            }
#endif
#if os(iOS)
            ToolbarItemGroup(placement: .bottomBar) {
                filterButton
                Spacer()
                if !filters.isEmpty {
                    VStack {
                        Text("Filtered by:")
                            .font(.caption2)
                        Button {
                            showFilters = true
                        } label: {
                            Text(FoodFilters.selectedDescription(of: filters, ingredients: ingredients))
                                .font(.caption2)
                                .foregroundStyle(.tint)
                                .frame(maxWidth: 250)
                                .lineLimit(2)
                        }
                        .buttonStyle(.plain)
                    }
                }
                Spacer()
            }
#endif
            
            ToolbarItem(placement: .principal) {
                Picker("Week", systemImage: "calendar", selection: $week) {
                    Text("Current Week").tag(MensaParser.Week.current)
                    Text("Next Week").tag(MensaParser.Week.next)
                }
                .pickerStyle(.segmented)
                .fixedSize()
            }
        }
        .sheet(isPresented: $showFilters) {
            NavigationStack {
                FoodFilters(ingredients: ingredients)
                    .toolbarTitleDisplayMode(.inline)
                    .toolbar() {
                        ToolbarItem(placement: .navigation) {
                            Button("Close") {
                                showFilters = false
                            }
                        }
                    }
            }
        }
    }
    
#if os(macOS)
    var subtitle: Text {
        filters.isEmpty
            ? Text(verbatim: "")
            : Text("Filtered by:") + Text(verbatim: " ") + Text(FoodFilters.selectedDescription(of: filters, ingredients: ingredients))
    }
#endif
    
    var listOverlay: some View {
        Group {
            if selectedMenu == nil {
                ContentUnavailableView {
                    ProgressView("Loading…")
                }
#if os(iOS)
                .background(Color(UIColor.systemGroupedBackground))
#endif
            } else if selectedMenu!.isEmpty {
                ContentUnavailableView {
                    Text("No menu items")
                }
#if os(iOS)
                .background(Color(UIColor.systemGroupedBackground))
#endif
            } else {
                EmptyView()
            }
        }
    }
    
    var filterButton: some View {
        Button("Filter", systemImage: filters.isEmpty ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill") {
#if os(macOS)
            openWindow(id: "filters")
#else
            showFilters = true
#endif
        }
    }
}

#Preview {
    @Previewable @State var selectedMenuItem: MenuOfTheDay.Item? = nil
    
    LocationDetails(location: .flensburg(.mensa), menusByLocation: .constant([:]), ingredients: .constant([:]), selectedMenuItem: $selectedMenuItem, loadMenu: { _ in Task { } }, loadIngredients: { Task { } })
}
