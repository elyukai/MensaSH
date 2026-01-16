//
//  MensaSHWatchApp.swift
//  MensaSHWatch Watch App
//
//  Created by Lukas Obermann on 20.08.25.
//

import SwiftUI

@main
struct MensaSHWatch_Watch_AppApp: App {
    @State private var menusByLocation: [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [:]
    @State private var ingredients: [String: Ingredient] = [:]
    
    var body: some Scene {
        WindowGroup {
            ContentView(menusByLocation: $menusByLocation, ingredients: $ingredients)
        }
    }
}
