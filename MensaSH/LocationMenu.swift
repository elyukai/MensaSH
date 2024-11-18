//
//  LocationMenu.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

struct LocationMenu: View {
    @Binding var location: Location
    
    var body: some View {
//        Picker("Location", systemImage: "fork.knife", selection: $location) {
//            ForEach(City.allCases) { city in
//                Section(city.description) {
//                    ForEach(city.buildings) { building in
//                        Text(building.description).tag(building.location)
//                    }
//                }
//            }
//        }
        Menu("Location", systemImage: "location") {
            ForEach(City.allCases.sorted(by: { $0.description.localizedCompare($1.description) == .orderedAscending })) { city in
                Section(city.description) {
                    ForEach(city.buildings.sorted(by: { $0.description.localizedCompare($1.description) == .orderedAscending })) { building in
                        Button {
                            location = building.location
                        } label: {
                            HStack {
                                Text(building.description)
                                if building.location == location {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var location: Location = .flensburg(.mensa)
    LocationMenu(location: $location)
}
