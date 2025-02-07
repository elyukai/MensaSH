//
//  ContentView.swift
//  MensaSH
//
//  Created by Lukas Obermann on 17.11.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.locale) private var locale
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @AppStorage("filters") private var filters: Set<String> = []
    @AppStorage("location") private var location: Location?
    @Binding var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])]
    @Binding var ingredients: [String: Ingredient]
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var selectedMenuItem: MenuOfTheDay.Item? = nil
    
    private var locationListBinding: Binding<Location?> {
        Binding {
            self.location
        } set: { newValue in
            if let newValue {
                self.location = newValue
            }
        }
    }

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            LocationList(selectedLocation: $location)
        } content: {
            if let location {
                LocationDetails(location: location, menusByLocation: $menusByLocation, ingredients: $ingredients, selectedMenuItem: $selectedMenuItem, loadMenu: loadMenu, loadIngredients: loadIngredients)
            } else {
                ContentUnavailableView("No location selected", systemImage: "location")
            }
        } detail: {
            if let selectedMenuItem {
                MenuItemDetails(menuItem: selectedMenuItem, ingredients: $ingredients)
            } else {
                ContentUnavailableView("No menu item selected", systemImage: "fork.knife.circle")
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onChange(of: locale) {
            Task {
                if let location {
                    await loadMenu(location: location)
                }
                await loadIngredients()
            }
        }
        .onChange(of: location) {
            selectedMenuItem = nil
        }
        .task {
            if let location {
                await loadMenu(location: location)
            }
            await loadIngredients()
        }
    }
    
    func loadMenu(location: Location) async {
        let _ = await Task {
            do {
                let parser = MensaParser()
                menusByLocation[location] = try await parser.readWeeklyMenu(for: location, language: language)
            } catch {
                menusByLocation[location] = (current: [], next: [])
            }
        }.result
    }
    
    func loadIngredients() async {
        let _ = await Task {
            do {
                let parser = MensaParser()
                ingredients = try await parser.readIngredients(language: language)
            } catch {
                ingredients = [:]
            }
        }.result
    }
    
    var language: MensaParser.Language {
        locale.language.languageCode?.identifier == "de" ? .german : .english
    }
}

#Preview {
    @Previewable @State var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [:]
    @Previewable @State var ingredients: [String: Ingredient] = [:]
    
    ContentView(menusByLocation: $menusByLocation, ingredients: $ingredients)
}
