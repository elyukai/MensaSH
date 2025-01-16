//
//  Ingredient.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

struct Ingredient: Identifiable, Hashable {
    typealias ID = String
    
    let abbreviation: String
    let name: String
    let kind: Kind
    let exclude: Bool
    let includes: [ID]
    
    var id: ID { abbreviation }
    
    enum Kind: String {
        case allergen = "1", additive = "2", preference = "3"
    }
    
    func includesTransitive(ingredients: any Collection<Ingredient>) -> Set<ID> {
        Set(includes.flatMap { ingredientId -> [ID] in
            guard let ingredient = ingredients.first(where: { $0.id == ingredientId }) else { return [] }
            return [ingredient.id] + ingredient.includesTransitive(ingredients: ingredients)
        })
    }
    
    static func extend(filters: Set<ID>, withTransitiveFiltersFrom ingredients: any Collection<Ingredient>) -> Set<ID> {
        filters.reduce(Set<ID>()) { extendedFilters, filter in
            guard let ingredient = ingredients.first(where: { $0.id == filter }) else { return extendedFilters }
            return extendedFilters.union(ingredient.includesTransitive(ingredients: ingredients))
        }
    }
}
