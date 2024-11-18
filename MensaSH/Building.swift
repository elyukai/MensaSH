//
//  Building.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

enum Building: Int, CaseIterable, Identifiable {
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
        switch self {
        case .mensa1: String(localized: "Mensa I with Cafeteria and Café Lounge")
        case .mensa2: String(localized: "Mensa II with Cafeteria and Café Lounge")
        case .mensaGaarden: String(localized: "Mensa Gaarden")
        case .mensaKesselhaus: String(localized: "Mensa Kesselhaus")
        case .schwentineMensa: String(localized: "Schwentine Canteen")
        case .cafeteriaAndAmericanDiner: String(localized: "Cafeteria & American Diner")
        case .cafeteriaDockside: String(localized: "Cafeteria “Dockside”")
        case .mensaFlensburg: String(localized: "Mensa Flensburg with Café Lounge")
        case .cafeteriaBBuilding: String(localized: "Cafeteria Building B")
        case .mensaLuebeckWithCafeteria: String(localized: "Mensa Lübeck with Cafeteria")
        case .cafeteriaMusikhochschule: String(localized: "Cafeteria Conservatory")
        case .mensaHeide: String(localized: "Mensa Heide with Cafeteria")
        case .cafeteriaWedel: String(localized: "Cafeteria Wedel")
        case .mensaOsterroenfeld: String(localized: "Mensa Osterrönfeld")
        }
    }
}
