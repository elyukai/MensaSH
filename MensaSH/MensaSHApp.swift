//
//  MensaSHApp.swift
//  MensaSH
//
//  Created by Lukas Obermann on 17.11.24.
//

import SwiftUI
import SwiftData

@main
struct MensaSHApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    @State private var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [:]
    @State private var ingredients: [String: Ingredient] = [:]

    var body: some Scene {
        WindowGroup {
            ContentView(menusByLocation: $menusByLocation, ingredients: $ingredients)
        }

#if os(macOS)
        UtilityWindow("Filters", id: "filters") {
            FoodFilters(ingredients: ingredients)
        }
#endif
//        .modelContainer(sharedModelContainer)
    }
}
