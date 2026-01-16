//
//  ContentView.swift
//  MensaSHWatch Watch App
//
//  Created by Lukas Obermann on 20.08.25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.locale) private var locale
    @AppStorage("location") private var location: Location = .flensburg(.mensa)
    @State private var showLocations = false
    @Binding var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])]
    @Binding var ingredients: [String: Ingredient]
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
        NavigationStack {
            LocationDetails(location: location, menusByLocation: $menusByLocation, ingredients: $ingredients, selectedMenuItem: $selectedMenuItem, loadMenu: loadMenu, loadIngredients: loadIngredients)
            .navigationTitle("Today")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Select Location", systemImage: "location") {
                        showLocations = true
                    }
                }
            }
            .sheet(isPresented: $showLocations) {
                LocationList(selectedLocation: locationListBinding)
            }
            .navigationDestination(for: MenuOfTheDay.Item.self) { menuItem in
                MenuItemDetails(menuItem: menuItem, ingredients: $ingredients)
            }
        }
        .onChange(of: locale) {
            Task {
//                    if let location {
                    await loadMenu(location: location)
//                    }
                await loadIngredients()
            }
        }
        .onChange(of: location) {
            selectedMenuItem = nil
        }
        .task {
//                if let location {
                await loadMenu(location: location)
//                }
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
