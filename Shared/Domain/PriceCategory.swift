//
//  PriceCategory.swift
//  MensaSH
//
//  Created by Lukas Obermann on 07.02.25.
//

import AppIntents

enum PriceCategory: Int, AppEnum {
    case students, universityMembers, guests

    static let typeDisplayRepresentation = TypeDisplayRepresentation(name: "Price Category")

    static let caseDisplayRepresentations = [
        PriceCategory.students: DisplayRepresentation(title: "Students"),
        PriceCategory.universityMembers: DisplayRepresentation(title: "University Members"),
        PriceCategory.guests: DisplayRepresentation(title: "Guests"),
    ]
    
    var index: Int {
        switch self {
        case .students:
            return 0
        case .universityMembers:
            return 1
        case .guests:
            return 2
        }
    }
}
