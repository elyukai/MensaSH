//
//  MenuItemAbbreviationList.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct MenuItemAbbreviationList: View {
    var label: LocalizedStringKey
    var list: [String]
    var abbreviations: [String: Ingredient]
    
    var body: some View {
        Section(label) {
            if list.isEmpty {
                Text("None")
                    .foregroundStyle(.secondary)
            }
            
            ForEach(list.sorted(by: { $0.localizedStandardCompare($1) == .orderedAscending }), id: \.self) { abbr in
                LabeledContent(abbr, value: abbreviations[abbr]?.name ?? "")
            }
        }
    }
}

#Preview {
    MenuItemAbbreviationList(label: "Allergens", list: ["GlH"], abbreviations: ["GlH": Ingredient(abbreviation: "GlH", name: "Gluten", kind: .allergen, exclude: true, includes: [])])
}
