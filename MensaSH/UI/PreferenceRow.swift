//
//  PreferenceRow.swift
//  MensaSH
//
//  Created by Lukas Obermann on 16.01.25.
//

import SwiftUI

struct PreferenceRow: View {
    var preference: Ingredient
    @Binding var preferenceValue: Bool
    var dependentPreferences: Set<Ingredient.ID>
    
    private var isAutomatic: Bool {
        dependentPreferences.contains(preference.id)
    }
    
    var body: some View {
        Toggle(isOn: isAutomatic ? .constant(true) : $preferenceValue) {
            preference.exclude ? Text("without \(preference.name)") : Text(preference.name)
        }
        .disabled(isAutomatic)
    }
}

#Preview {
    @Previewable @State var preferenceValue = false
    NavigationStack {
        PreferenceRow(preference: Ingredient(abbreviation: "AGS", name: "Schwein aus artgerechter Haltung", kind: .preference, exclude: false, includes: []), preferenceValue: $preferenceValue, dependentPreferences: [])
    }
}
