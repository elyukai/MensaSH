//
//  Location.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

enum Location: Hashable, CaseIterable, RawRepresentable {
    init?(rawValue: Int) {
        guard let location = Building(rawValue: rawValue)?.location else { return nil }
        self = location
    }
    
    var rawValue: Int { rawValues.1.rawValue }
    
    case kiel(LocationInKiel)
    case flensburg(LocationInFlensburg)
    case luebeck(LocationInLuebeck)
    case heide(LocationInHeide)
    case wedel(LocationInWedel)
    case osterroenfeld(LocationInOsterroenfeld)
    
    enum LocationInKiel {
        case mensa1,
             mensa2,
             mensaGaarden,
             mensaKesselhaus,
             mensaSchwentine,
             cafeteriaAmericanDiner,
             cafeteriaDockside
    }
    
    enum LocationInFlensburg {
        case mensa,
             cafeteria
    }
    
    enum LocationInLuebeck {
        case mensaCafeteria,
             cafeteriaMusikhochschule
    }
    
    enum LocationInHeide {
        case mensa
    }
    
    enum LocationInWedel {
        case cafeteria
    }
    
    enum LocationInOsterroenfeld {
        case mensa
    }
    
    var rawValues: (City, Building) {
        switch self {
        case .kiel(.mensa1): (.kiel, .mensa1)
        case .kiel(.mensa2): (.kiel, .mensa2)
        case .kiel(.mensaGaarden): (.kiel, .mensaGaarden)
        case .kiel(.mensaKesselhaus): (.kiel, .mensaKesselhaus)
        case .kiel(.mensaSchwentine): (.kiel, .schwentineMensa)
        case .kiel(.cafeteriaDockside): (.kiel, .cafeteriaDockside)
        case .kiel(.cafeteriaAmericanDiner): (.kiel, .cafeteriaAndAmericanDiner)
        case .flensburg(.mensa): (.flensburg, .mensaFlensburg)
        case .flensburg(.cafeteria): (.flensburg, .cafeteriaBBuilding)
        case .luebeck(.mensaCafeteria): (.luebeck, .mensaLuebeckWithCafeteria)
        case .luebeck(.cafeteriaMusikhochschule): (.luebeck, .cafeteriaMusikhochschule)
        case .heide(.mensa): (.heide, .mensaHeide)
        case .wedel(.cafeteria): (.wedel, .cafeteriaWedel)
        case .osterroenfeld(.mensa): (.osterroenfeld, .mensaOsterroenfeld)
        }
    }

    static let allCases: [Location] = [
        .kiel(.mensa1),
        .kiel(.mensa2),
        .kiel(.mensaGaarden),
        .kiel(.mensaKesselhaus),
        .kiel(.mensaSchwentine),
        .kiel(.cafeteriaDockside),
        .kiel(.cafeteriaAmericanDiner),
        .flensburg(.mensa),
        .flensburg(.cafeteria),
        .luebeck(.mensaCafeteria),
        .luebeck(.cafeteriaMusikhochschule),
        .heide(.mensa),
        .wedel(.cafeteria),
        .osterroenfeld(.mensa)
    ]
}
