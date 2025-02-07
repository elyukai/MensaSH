//
//  Building.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import AppIntents
import SwiftUI

enum Building: Int, CaseIterable, Identifiable, AppEnum {
    case mensa1 = 1
    case mensa2 = 2
    case mensaGaarden = 3
    case mensaKesselhaus = 4
    case schwentineMensa = 5
    case cafeteriaAndAmericanDiner = 6
    case mensaFlensburg = 7
    case mensaLuebeckWithCafeteria = 8
    case cafeteriaMusikhochschule = 9
    case mensaOsterroenfeld = 10
    case mensaHeide = 11
    case cafeteriaBBuilding = 14
    case cafeteriaWedel = 15
    case cafeteriaDockside = 16
    
    var id: Int { rawValue }
    
    var city: City {
        switch self {
        case .mensa1, .mensa2, .mensaGaarden, .mensaKesselhaus, .schwentineMensa, .cafeteriaAndAmericanDiner, .cafeteriaDockside:
                .kiel
        case .mensaFlensburg, .cafeteriaBBuilding:
                .flensburg
        case .mensaLuebeckWithCafeteria, .cafeteriaMusikhochschule:
                .luebeck
        case .mensaHeide:
                .heide
        case .cafeteriaWedel:
                .wedel
        case .mensaOsterroenfeld:
                .osterroenfeld
        }
    }
    
    var location: Location {
        switch self {
        case .mensa1: .kiel(.mensa1)
        case .mensa2: .kiel(.mensa2)
        case .mensaGaarden: .kiel(.mensaGaarden)
        case .mensaKesselhaus: .kiel(.mensaKesselhaus)
        case .schwentineMensa: .kiel(.mensaSchwentine)
        case .cafeteriaDockside: .kiel(.cafeteriaDockside)
        case .cafeteriaAndAmericanDiner: .kiel(.cafeteriaAmericanDiner)
        case .mensaFlensburg: .flensburg(.mensa)
        case .cafeteriaBBuilding: .flensburg(.cafeteria)
        case .mensaLuebeckWithCafeteria: .luebeck(.mensaCafeteria)
        case .cafeteriaMusikhochschule: .luebeck(.cafeteriaMusikhochschule)
        case .mensaHeide: .heide(.mensa)
        case .cafeteriaWedel: .wedel(.cafeteria)
        case .mensaOsterroenfeld: .osterroenfeld(.mensa)
        }
    }
    
    var description: String {
        String(localized: localizedDescription)
    }
    
    var localizedDescription: LocalizedStringResource {
        switch self {
        case .mensa1: "Mensa I with Cafeteria and Café Lounge"
        case .mensa2: "Mensa II with Cafeteria and Café Lounge"
        case .mensaGaarden: "Mensa Gaarden"
        case .mensaKesselhaus: "Mensa Kesselhaus"
        case .schwentineMensa: "Schwentine Canteen"
        case .cafeteriaAndAmericanDiner: "Cafeteria & American Diner"
        case .cafeteriaDockside: "Cafeteria “Dockside”"
        case .mensaFlensburg: "Mensa Flensburg with Café Lounge"
        case .cafeteriaBBuilding: "Cafeteria Building B"
        case .mensaLuebeckWithCafeteria: "Mensa Lübeck with Cafeteria"
        case .cafeteriaMusikhochschule: "Cafeteria Conservatory"
        case .mensaHeide: "Mensa Heide with Cafeteria"
        case .cafeteriaWedel: "Cafeteria Wedel"
        case .mensaOsterroenfeld: "Mensa Osterrönfeld"
        }
    }
    
    var shortDescription: String {
        String(localized: localizedShortDescription)
    }
    
    var localizedShortDescription: LocalizedStringResource {
        switch self {
        case .mensa1: "Mensa I"
        case .mensa2: "Mensa II"
        case .mensaGaarden: "Mensa Gaarden"
        case .mensaKesselhaus: "Mensa Kesselhaus"
        case .schwentineMensa: "Schwentine Canteen"
        case .cafeteriaAndAmericanDiner: "Cafeteria & American Diner"
        case .cafeteriaDockside: "Dockside"
        case .mensaFlensburg: "Mensa Flensburg"
        case .cafeteriaBBuilding: "Cafeteria Building B"
        case .mensaLuebeckWithCafeteria: "Mensa Lübeck"
        case .cafeteriaMusikhochschule: "Cafeteria Conservatory"
        case .mensaHeide: "Mensa Heide"
        case .cafeteriaWedel: "Cafeteria Wedel"
        case .mensaOsterroenfeld: "Mensa Osterrönfeld"
        }
    }
    
    static let typeDisplayRepresentation = TypeDisplayRepresentation(name: "Building")
    
    static let caseDisplayRepresentations = [
        Building.mensaFlensburg: DisplayRepresentation(title: "Mensa Flensburg with Café Lounge"),
        Building.cafeteriaBBuilding: DisplayRepresentation(title: "Cafeteria Building B"),
        Building.mensaHeide: DisplayRepresentation(title: "Mensa Heide with Cafeteria"),
        Building.mensa1: DisplayRepresentation(title: "Mensa I with Cafeteria and Café Lounge"),
        Building.mensa2: DisplayRepresentation(title: "Mensa II with Cafeteria and Café Lounge"),
        Building.mensaGaarden: DisplayRepresentation(title: "Mensa Gaarden"),
        Building.mensaKesselhaus: DisplayRepresentation(title: "Mensa Kesselhaus"),
        Building.schwentineMensa: DisplayRepresentation(title: "Schwentine Canteen"),
        Building.cafeteriaAndAmericanDiner: DisplayRepresentation(title: "Cafeteria & American Diner"),
        Building.cafeteriaDockside: DisplayRepresentation(title: "Cafeteria “Dockside”"),
        Building.mensaLuebeckWithCafeteria: DisplayRepresentation(title: "Mensa Lübeck with Cafeteria"),
        Building.cafeteriaMusikhochschule: DisplayRepresentation(title: "Cafeteria Conservatory"),
        Building.mensaOsterroenfeld: DisplayRepresentation(title: "Mensa Osterrönfeld"),
        Building.cafeteriaWedel: DisplayRepresentation(title: "Cafeteria Wedel"),
    ]
}
