//
//  LocationList.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct LocationList: View {
    @Binding var selectedLocation: Location?
    
    var body: some View {
        List(City.allCases.sorted(by: { $0.description.localizedCompare($1.description) == .orderedAscending }), selection: $selectedLocation) { city in
            Section(city.description) {
                ForEach(city.buildings.sorted(by: { $0.description.localizedCompare($1.description) == .orderedAscending })) { building in
                    NavigationLink(value: building.location) {
                        Text(building.description)
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Canteens")
    }
}

#Preview {
    @Previewable @State var selectedLocation: Location?
    LocationList(selectedLocation: $selectedLocation)
}
