//
//  Item.swift
//  Mensa
//
//  Created by Lukas Obermann on 17.11.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
