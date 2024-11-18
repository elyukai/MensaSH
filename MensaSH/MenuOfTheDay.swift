//
//  MenuOfTheDay.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import Foundation

struct MenuOfTheDay: Identifiable, Hashable {
    let date: Date
    let menu: [MenuItem]
    let announcements: [String]
    
    var id: Date { date }
    
    struct MenuItem: Identifiable, Hashable {
        let date: Date
        let name: [NamePart]
        let allergens: [String]
        let additives: [String]
        let types: [String]
        let prices: [Decimal]
        
        var id: String { description }
        var description: String {
            name.map { $0.name }.joined(separator: " ")
        }
        var fullDescription: String {
            name.map { $0.description }.joined(separator: " ")
        }
        
        var hasDifferentPrices: Bool {
            Set(prices).count > 1
        }
        
        func contains(_ ingredient: Ingredient) -> Bool {
            allergens.contains { $0 == ingredient.abbreviation } || additives.contains { $0 == ingredient.abbreviation } || types.contains { $0 == ingredient.abbreviation }
        }
        
        struct NamePart: Hashable {
            let name: String
            let additions: [String]?
            
            var description: String {
                if let additions {
                    return "\(name) (\(additions.joined(separator: ", ")))"
                } else {
                    return name
                }
            }
        }
    }
}
