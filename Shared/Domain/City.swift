//
//  City.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import SwiftUI

enum City: Int, CaseIterable, Identifiable {
    case kiel = 1
    case flensburg = 2
    case luebeck = 3
    case heide = 4
    case wedel = 5
    case osterroenfeld = 6
    
    var id: Int { rawValue }
    
    var buildings: [Building] {
        switch self {
        case .kiel:
            [.mensa1, .mensa2, .mensaGaarden, .mensaKesselhaus, .schwentineMensa, .cafeteriaAndAmericanDiner, .cafeteriaDockside]
        case .flensburg:
            [.mensaFlensburg, .cafeteriaBBuilding]
        case .luebeck:
            [.mensaLuebeckWithCafeteria, .cafeteriaMusikhochschule]
        case .heide:
            [.mensaHeide]
        case .wedel:
            [.cafeteriaWedel]
        case .osterroenfeld:
            [.mensaOsterroenfeld]
        }
    }
    
    var description: String {
        switch self {
        case .kiel: String(localized: "Kiel")
        case .flensburg: String(localized: "Flensburg")
        case .luebeck: String(localized: "Lübeck")
        case .heide: String(localized: "Heide")
        case .wedel: String(localized: "Wedel")
        case .osterroenfeld: String(localized: "Osterrönfeld")
        }
    }
}
