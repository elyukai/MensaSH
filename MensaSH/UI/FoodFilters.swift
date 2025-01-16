//
//  FoodFilters.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct FoodFilters: View {
    var ingredients: [String: Ingredient]
    @AppStorage("filters") private var filters: Set<String> = []
    
    private var allergens: [Ingredient] {
        prepareIngredients(ofKind: .allergen).sorted(by: { $0.name.localizedStandardCompare($1.name) == .orderedAscending })
    }
    
    private var additives: [Ingredient] {
        prepareIngredients(ofKind: .additive).sorted(by: { $0.id.localizedStandardCompare($1.id) == .orderedAscending })
    }
    
    private var preferences: [Ingredient] {
        prepareIngredients(ofKind: .preference).sorted(by: { $0.name.localizedStandardCompare($1.name) == .orderedAscending })
    }
    
    private var dependentPreferences: Set<Ingredient.ID> {
        Ingredient.extend(filters: filters, withTransitiveFiltersFrom: preferences).subtracting(filters)
    }
    
    var body: some View {
        List {
            if !ingredients.isEmpty {
                Section("Without allergens") {
                    ForEach(allergens) { allergen in
                        Toggle(isOn: createBinding(for: allergen)) {
                            LabeledContent(allergen.name) {
                                Text(allergen.abbreviation)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                
                Section("Without additives") {
                    ForEach(additives) { additive in
                        Toggle(isOn: createBinding(for: additive)) {
                            LabeledContent(additive.name) {
                                Text(additive.abbreviation)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                
                Section("Preferences") {
                    ForEach(preferences) { preference in
                        PreferenceRow(preference: preference, preferenceValue: createBinding(for: preference), dependentPreferences: dependentPreferences)
                    }
                }
            }
        }
        .navigationTitle("Filters")
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button("Reset") {
                    filters = []
                }
                .disabled(filters.isEmpty)
            }
        }
        .overlay {
            if ingredients.isEmpty {
                ContentUnavailableView {
                    ProgressView("Loading…")
                }
            }
        }
    }
    
    private func prepareIngredients(ofKind kind: Ingredient.Kind) -> [Ingredient] {
        ingredients.values.filter { $0.kind == kind }
    }
    
    private func createBinding(for ingredient: Ingredient) -> Binding<Bool> {
        Binding(
            get: {
                filters.contains(ingredient.id)
            },
            set: { newValue in
                if newValue {
                    filters.insert(ingredient.id)
                } else {
                    filters.remove(ingredient.id)
                }
            }
        )
    }
    
    static func selectedDescription(of filters: Set<String>, ingredients: [String: Ingredient]) -> String {
        filters
            .map { ingredients[$0]?.name ?? $0 }
            .sorted(by: { $0.localizedStandardCompare($1) == .orderedAscending })
            .joined(separator: ", ")
    }
}

#Preview {
    NavigationStack {
        FoodFilters(ingredients: [
            "Ei": Ingredient(abbreviation: "Ei", name: "Eier", kind: .allergen, exclude: true, includes: []),
            "En": Ingredient(abbreviation: "En", name: "Erdnüsse", kind: .allergen, exclude: true, includes: []),
            "Fi": Ingredient(abbreviation: "Fi", name: "Fisch", kind: .allergen, exclude: true, includes: []),
            "GlD": Ingredient(abbreviation: "GlD", name: "Dinkel", kind: .allergen, exclude: true, includes: []),
            "GlG": Ingredient(abbreviation: "GlG", name: "Gerste", kind: .allergen, exclude: true, includes: []),
            "GlH": Ingredient(abbreviation: "GlH", name: "Hafer", kind: .allergen, exclude: true, includes: []),
            "GlK": Ingredient(abbreviation: "GlK", name: "Kamut", kind: .allergen, exclude: true, includes: []),
            "GlR": Ingredient(abbreviation: "GlR", name: "Roggen", kind: .allergen, exclude: true, includes: []),
            "GlW": Ingredient(abbreviation: "GlW", name: "Weizen", kind: .allergen, exclude: true, includes: []),
            "Kr": Ingredient(abbreviation: "Kr", name: "Krebstiere", kind: .allergen, exclude: true, includes: []),
            "Lu": Ingredient(abbreviation: "Lu", name: "Lupine", kind: .allergen, exclude: true, includes: []),
            "Mi": Ingredient(abbreviation: "Mi", name: "Milch und Laktose", kind: .allergen, exclude: true, includes: []),
            "NC": Ingredient(abbreviation: "NC", name: "Cashewnüsse", kind: .allergen, exclude: true, includes: []),
            "NH": Ingredient(abbreviation: "NH", name: "Haselnüsse", kind: .allergen, exclude: true, includes: []),
            "NMc": Ingredient(abbreviation: "NMc", name: "Macadamianüsse", kind: .allergen, exclude: true, includes: []),
            "NMn": Ingredient(abbreviation: "NMn", name: "Mandeln", kind: .allergen, exclude: true, includes: []),
            "NPa": Ingredient(abbreviation: "NPa", name: "Paranüsse", kind: .allergen, exclude: true, includes: []),
            "NPe": Ingredient(abbreviation: "NPe", name: "Pekannüsse", kind: .allergen, exclude: true, includes: []),
            "NPi": Ingredient(abbreviation: "NPi", name: "Pistazien", kind: .allergen, exclude: true, includes: []),
            "NW": Ingredient(abbreviation: "NW", name: "Walnüsse", kind: .allergen, exclude: true, includes: []),
            "Se": Ingredient(abbreviation: "Se", name: "Sesam", kind: .allergen, exclude: true, includes: []),
            "Sf": Ingredient(abbreviation: "Sf", name: "Senf", kind: .allergen, exclude: true, includes: []),
            "Sl": Ingredient(abbreviation: "Sl", name: "Sellerie", kind: .allergen, exclude: true, includes: []),
            "So": Ingredient(abbreviation: "So", name: "Soja", kind: .allergen, exclude: true, includes: []),
            "Sw": Ingredient(abbreviation: "Sw", name: "Schwefeldioxid und Sulfite", kind: .allergen, exclude: true, includes: []),
            "Wt": Ingredient(abbreviation: "Wt", name: "Weichtiere", kind: .allergen, exclude: true, includes: []),
            "1": Ingredient(abbreviation: "1", name: "Farbstoff", kind: .additive, exclude: true, includes: []),
            "2": Ingredient(abbreviation: "2", name: "Konservierungsstoff", kind: .additive, exclude: true, includes: []),
            "3": Ingredient(abbreviation: "3", name: "Antioxidationsmittel", kind: .additive, exclude: true, includes: []),
            "4": Ingredient(abbreviation: "4", name: "Geschmacksverstärker", kind: .additive, exclude: true, includes: []),
            "5": Ingredient(abbreviation: "5", name: "geschwefelt", kind: .additive, exclude: true, includes: []),
            "6": Ingredient(abbreviation: "6", name: "geschwärzt", kind: .additive, exclude: true, includes: []),
            "7": Ingredient(abbreviation: "7", name: "gewachst", kind: .additive, exclude: true, includes: []),
            "8": Ingredient(abbreviation: "8", name: "Süßungsmittel", kind: .additive, exclude: true, includes: []),
            "9": Ingredient(abbreviation: "9", name: "Phenylalaninquelle", kind: .additive, exclude: true, includes: []),
            "10": Ingredient(abbreviation: "10", name: "Phosphat", kind: .additive, exclude: true, includes: []),
            "11": Ingredient(abbreviation: "11", name: "Kakaohaltige Fettglasur", kind: .additive, exclude: true, includes: []),
            "12": Ingredient(abbreviation: "12", name: "z.T. zerkleinertes Fleisch", kind: .additive, exclude: true, includes: []),
            "vn": Ingredient(abbreviation: "vn", name: "vegan", kind: .preference, exclude: false, includes: []),
            "ve": Ingredient(abbreviation: "ve", name: "vegetarisch", kind: .preference, exclude: false, includes: []),
            "SHT": Ingredient(abbreviation: "SHT", name: "Schleswig-Holstein Teller", kind: .preference, exclude: false, includes: []),
            "STF": Ingredient(abbreviation: "STF", name: "Streetfood", kind: .preference, exclude: false, includes: []),
            "BIO": Ingredient(abbreviation: "BIO", name: "mit Zutat aus ökologischer Erzeugung, s. (Bio)-Hinweis", kind: .preference, exclude: false, includes: []),
            "S": Ingredient(abbreviation: "S", name: "Schwein", kind: .preference, exclude: false, includes: []),
            "R": Ingredient(abbreviation: "R", name: "Rind", kind: .preference, exclude: false, includes: []),
            "L": Ingredient(abbreviation: "L", name: "Lamm", kind: .preference, exclude: false, includes: []),
            "G": Ingredient(abbreviation: "G", name: "Geflügel", kind: .preference, exclude: false, includes: []),
            "AGS": Ingredient(abbreviation: "AGS", name: "Schwein aus artgerechter Haltung", kind: .preference, exclude: false, includes: []),
            "AGR": Ingredient(abbreviation: "AGR", name: "Rind aus artgerechter Haltung", kind: .preference, exclude: false, includes: []),
            "AGL": Ingredient(abbreviation: "AGL", name: "Lamm aus artgerechter Haltung", kind: .preference, exclude: false, includes: []),
            "AGG": Ingredient(abbreviation: "AGG", name: "Geflügel aus artgerechter Haltung", kind: .preference, exclude: false, includes: []),
            "AGF": Ingredient(abbreviation: "AGF", name: "Fisch aus artgerechter Haltung", kind: .preference, exclude: false, includes: []),
            "A": Ingredient(abbreviation: "A", name: "Alkohol", kind: .preference, exclude: true, includes: [])
        ])
    }
}
