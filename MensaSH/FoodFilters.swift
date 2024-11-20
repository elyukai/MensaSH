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
                        Toggle(isOn: createBinding(for: preference)) {
                            Text(preference.name)
                        }
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
            "Ei": Ingredient(abbreviation: "Ei", name: "Eier", kind: .allergen, exclude: true),
            "En": Ingredient(abbreviation: "En", name: "Erdnüsse", kind: .allergen, exclude: true),
            "Fi": Ingredient(abbreviation: "Fi", name: "Fisch", kind: .allergen, exclude: true),
            "GlD": Ingredient(abbreviation: "GlD", name: "Dinkel", kind: .allergen, exclude: true),
            "GlG": Ingredient(abbreviation: "GlG", name: "Gerste", kind: .allergen, exclude: true),
            "GlH": Ingredient(abbreviation: "GlH", name: "Hafer", kind: .allergen, exclude: true),
            "GlK": Ingredient(abbreviation: "GlK", name: "Kamut", kind: .allergen, exclude: true),
            "GlR": Ingredient(abbreviation: "GlR", name: "Roggen", kind: .allergen, exclude: true),
            "GlW": Ingredient(abbreviation: "GlW", name: "Weizen", kind: .allergen, exclude: true),
            "Kr": Ingredient(abbreviation: "Kr", name: "Krebstiere", kind: .allergen, exclude: true),
            "Lu": Ingredient(abbreviation: "Lu", name: "Lupine", kind: .allergen, exclude: true),
            "Mi": Ingredient(abbreviation: "Mi", name: "Milch und Laktose", kind: .allergen, exclude: true),
            "NC": Ingredient(abbreviation: "NC", name: "Cashewnüsse", kind: .allergen, exclude: true),
            "NH": Ingredient(abbreviation: "NH", name: "Haselnüsse", kind: .allergen, exclude: true),
            "NMc": Ingredient(abbreviation: "NMc", name: "Macadamianüsse", kind: .allergen, exclude: true),
            "NMn": Ingredient(abbreviation: "NMn", name: "Mandeln", kind: .allergen, exclude: true),
            "NPa": Ingredient(abbreviation: "NPa", name: "Paranüsse", kind: .allergen, exclude: true),
            "NPe": Ingredient(abbreviation: "NPe", name: "Pekannüsse", kind: .allergen, exclude: true),
            "NPi": Ingredient(abbreviation: "NPi", name: "Pistazien", kind: .allergen, exclude: true),
            "NW": Ingredient(abbreviation: "NW", name: "Walnüsse", kind: .allergen, exclude: true),
            "Se": Ingredient(abbreviation: "Se", name: "Sesam", kind: .allergen, exclude: true),
            "Sf": Ingredient(abbreviation: "Sf", name: "Senf", kind: .allergen, exclude: true),
            "Sl": Ingredient(abbreviation: "Sl", name: "Sellerie", kind: .allergen, exclude: true),
            "So": Ingredient(abbreviation: "So", name: "Soja", kind: .allergen, exclude: true),
            "Sw": Ingredient(abbreviation: "Sw", name: "Schwefeldioxid und Sulfite", kind: .allergen, exclude: true),
            "Wt": Ingredient(abbreviation: "Wt", name: "Weichtiere", kind: .allergen, exclude: true),
            "1": Ingredient(abbreviation: "1", name: "Farbstoff", kind: .additive, exclude: true),
            "2": Ingredient(abbreviation: "2", name: "Konservierungsstoff", kind: .additive, exclude: true),
            "3": Ingredient(abbreviation: "3", name: "Antioxidationsmittel", kind: .additive, exclude: true),
            "4": Ingredient(abbreviation: "4", name: "Geschmacksverstärker", kind: .additive, exclude: true),
            "5": Ingredient(abbreviation: "5", name: "geschwefelt", kind: .additive, exclude: true),
            "6": Ingredient(abbreviation: "6", name: "geschwärzt", kind: .additive, exclude: true),
            "7": Ingredient(abbreviation: "7", name: "gewachst", kind: .additive, exclude: true),
            "8": Ingredient(abbreviation: "8", name: "Süßungsmittel", kind: .additive, exclude: true),
            "9": Ingredient(abbreviation: "9", name: "Phenylalaninquelle", kind: .additive, exclude: true),
            "10": Ingredient(abbreviation: "10", name: "Phosphat", kind: .additive, exclude: true),
            "11": Ingredient(abbreviation: "11", name: "Kakaohaltige Fettglasur", kind: .additive, exclude: true),
            "12": Ingredient(abbreviation: "12", name: "z.T. zerkleinertes Fleisch", kind: .additive, exclude: true),
            "vn": Ingredient(abbreviation: "vn", name: "vegan", kind: .preference, exclude: false),
            "ve": Ingredient(abbreviation: "ve", name: "vegetarisch", kind: .preference, exclude: false),
            "SHT": Ingredient(abbreviation: "SHT", name: "Schleswig-Holstein Teller", kind: .preference, exclude: false),
            "STF": Ingredient(abbreviation: "STF", name: "Streetfood", kind: .preference, exclude: false),
            "BIO": Ingredient(abbreviation: "BIO", name: "mit Zutat aus ökologischer Erzeugung, s. (Bio)-Hinweis", kind: .preference, exclude: false),
            "S": Ingredient(abbreviation: "S", name: "Schwein", kind: .preference, exclude: false),
            "R": Ingredient(abbreviation: "R", name: "Rind", kind: .preference, exclude: false),
            "L": Ingredient(abbreviation: "L", name: "Lamm", kind: .preference, exclude: false),
            "G": Ingredient(abbreviation: "G", name: "Geflügel", kind: .preference, exclude: false),
            "AGS": Ingredient(abbreviation: "AGS", name: "Schwein aus artgerechter Haltung", kind: .preference, exclude: false),
            "AGR": Ingredient(abbreviation: "AGR", name: "Rind aus artgerechter Haltung", kind: .preference, exclude: false),
            "AGL": Ingredient(abbreviation: "AGL", name: "Lamm aus artgerechter Haltung", kind: .preference, exclude: false),
            "AGG": Ingredient(abbreviation: "AGG", name: "Geflügel aus artgerechter Haltung", kind: .preference, exclude: false),
            "AGF": Ingredient(abbreviation: "AGF", name: "Fisch aus artgerechter Haltung", kind: .preference, exclude: false),
            "A": Ingredient(abbreviation: "A", name: "ohne Alkohol", kind: .preference, exclude: true)
        ])
    }
}
