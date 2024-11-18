//
//  ContentView.swift
//  MensaSH
//
//  Created by Lukas Obermann on 17.11.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    @Environment(\.locale) private var locale
    @State private var abbreviations: [String: Ingredient] = [:]
    @AppStorage("filters") private var filters: Set<String> = []
    @AppStorage("location") private var location: Location = .kiel(.mensa1)
    @State private var week: MensaParser.Week = .current
    @State private var menu: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [:]
    @State private var showFilters: Bool = false
    
    enum PastMenu: Hashable {
        case pastMenu
    }
    
    var selectedMenu: [MenuOfTheDay]? {
        if let fromLocation = menu[location] {
            let intermediateMenu = switch week {
            case .current: fromLocation.current
            case .next: fromLocation.next
            }
            
            return intermediateMenu.map { menu in
                let filteredMenu = menu.menu.filter { menuItem in
                    filters.allSatisfy { filterId in
                        guard let ingredient = abbreviations[filterId] else { return true }
                        return menuItem.contains(ingredient) != ingredient.exclude
                    }
                }
                
                return MenuOfTheDay(date: menu.date, menu: filteredMenu, announcements: menu.announcements)
            }
        } else {
            return nil
        }
    }
    
    var pastMenu: [MenuOfTheDay]? {
        if let selectedMenu, week == .current {
            selectedMenu.filter { $0.date < Calendar.current.startOfDay(for: .now) }
        } else {
            nil
        }
    }
    
    var currentMenu: [MenuOfTheDay]? {
        if let selectedMenu, week == .current {
            selectedMenu.filter { $0.date >= Calendar.current.startOfDay(for: .now) }
        } else {
            selectedMenu
        }
    }

    var body: some View {
        NavigationStack {
            List {
                if let pastMenu, !pastMenu.isEmpty {
                    NavigationLink(value: PastMenu.pastMenu) {
                        Text("Earlier Week")
                    }
                }
                
                ForEachMenu(menu: currentMenu)
            }
#if os(iOS)
            .listSectionSpacing(.compact)
#endif
            .refreshable {
                let _ = await loadMenu().result
                let _ = await loadAbbreviations().result
            }
            .overlay {
                listOverlay
            }
            .navigationTitle(location.rawValues.1.description)
#if os(macOS)
            .navigationSubtitle(subtitle)
#endif
            .navigationDestination(for: MenuOfTheDay.MenuItem.self) { menuItem in
                MenuItemDetails(menuItem: menuItem, abbreviations: abbreviations)
            }
            .navigationDestination(for: PastMenu.self) { menuItem in
                List {
                    ForEachMenu(menu: pastMenu)
                }
                .navigationTitle("Earlier Week")
#if os(iOS)
                .listSectionSpacing(.compact)
#endif
            }
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
                            filteredByText
                                .font(.caption2)
                            Button {
                                showFilters = true
                            } label: {
                                selectedFiltersText
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
                ToolbarItem {
                    LocationMenu(location: $location)
                }
            }
            .sheet(isPresented: $showFilters) {
                NavigationStack {
                    FoodFilters(ingredients: abbreviations)
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
        .onChange(of: location) {
            loadMenu()
        }
        .onChange(of: locale) {
            loadMenu()
            loadAbbreviations()
        }
        .task {
            let _ = await loadMenu().result
            let _ = await loadAbbreviations().result
        }
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//#if os(macOS)
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//#endif
//            .toolbar {
//#if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
    
#if os(macOS)
    var subtitle: Text {
        filters.isEmpty ? Text(verbatim: "") : filteredByText + Text(verbatim: " ") + selectedFiltersText
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
            showFilters = true
        }
    }
    
    var filteredByText: Text {
        Text("Filtered by:")
    }
    
    var selectedFiltersText: Text {
        Text(
            filters
                .map { abbreviations[$0]?.name ?? $0 }
                .sorted(by: { $0.localizedStandardCompare($1) == .orderedAscending })
                .joined(separator: ", ")
        )
    }
    
    @discardableResult
    func loadMenu() -> Task<(), Error> {
        Task {
            do {
                let parser = MensaParser()
                menu[location] = try await parser.readWeeklyMenu(for: location, language: language)
            } catch {
                menu[location] = (current: [], next: [])
            }
        }
    }
    
    @discardableResult
    func loadAbbreviations() -> Task<(), Error> {
        Task {
            do {
                let parser = MensaParser()
                abbreviations = try await parser.readAbbreviations(language: language)
            } catch {
                abbreviations = [:]
            }
        }
    }
    
    var language: MensaParser.Language {
        locale.language.languageCode?.identifier == "de" ? .german : .english
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
