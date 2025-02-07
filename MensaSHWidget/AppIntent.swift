//
//  AppIntent.swift
//  MensaSHWidget
//
//  Created by Lukas Obermann on 16.01.25.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Configuration"
    static let description: IntentDescription = "Display the selected canteen’s current or upcoming menu."

    @Parameter(title: "Location", default: .mensa1)
    var building: Building

    @Parameter(title: "Price Category", default: .students)
    var priceCategory: PriceCategory
}
