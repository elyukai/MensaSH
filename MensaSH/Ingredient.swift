//
//  Ingredient.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

struct Ingredient: Identifiable, Hashable {
    let abbreviation: String
    let name: String
    let kind: Kind
    let exclude: Bool
    
    var id: String { abbreviation }
    
    enum Kind: String {
        case allergen = "1", additive = "2", preference = "3"
    }
}
