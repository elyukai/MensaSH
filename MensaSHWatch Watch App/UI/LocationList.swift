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
                    LocationListButton(selectedLocation: $selectedLocation, building: building)
                }
            }
        }
    }
}

struct LocationListButton: View {
    @Binding var selectedLocation: Location?
    let building: Building
    
    var body: some View {
        let location = building.location
        
        if selectedLocation == location {
            Button {} label: {
                HStack {
                    Text(building.description)
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        } else {
            Button {
                selectedLocation = location
            } label: {
                HStack {
                    Text(building.description)
                    Spacer()
                    Image(systemName: "checkmark")
                        .hidden()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedLocation: Location?
    LocationList(selectedLocation: $selectedLocation)
}
