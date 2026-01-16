//
//  MensaSHWidget.swift
//  MensaSHWidget
//
//  Created by Lukas Obermann on 16.01.25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func recommendations() -> [AppIntentRecommendation<ConfigurationAppIntent>] {
        []
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), menu: .examples.first!.value.current.first!, configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), menu: .examples.first!.value.current.first!, configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let parser = MensaParser()
        
        do {
            let menus = try await parser.readWeeklyMenu(for: configuration.building.location, inWeek: .current, language: .english)
            
            let entries: [SimpleEntry] = menus.map {
                SimpleEntry(date: $0.date, menu: $0, configuration: configuration)
            }
            
            return Timeline(entries: entries, policy: menus.isEmpty ? .atEnd : .after(menus.first!.date.advanced(by: 60 * 60 * 24)))
        } catch {
            return Timeline(entries: [], policy: .atEnd)
        }
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let menu: MenuOfTheDay
    let configuration: ConfigurationAppIntent
}

struct MensaSHWidgetList: View {
    @Environment(\.widgetFamily) var widgetFamily: WidgetFamily
    var entry: Provider.Entry
    var maxItems: Int
    
    var divider: some View {
        Divider()
            .overlay {
                LinearGradient(colors: [.teal, .green], startPoint: .leading, endPoint: .trailing).opacity(0.75)
            }
    }
    
    var spacing: CGFloat {
        switch widgetFamily {
        case .systemLarge, .systemExtraLarge:
            return 6
        case .systemSmall, .systemMedium:
            return 4
        default:
            return 4
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(entry.menu.items.prefix(entry.menu.items.count > maxItems ? maxItems - 1 : maxItems)) { menuItem in
                divider
                HStack {
                    Text(menuItem.description)
                        .font(.subheadline)
                        .lineLimit(3)
                    if let price = menuItem.prices[safe: entry.configuration.priceCategory.index] {
                        Spacer(minLength: 4)
                        Text(price, format: .currency(code: "EUR"))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

            }
            
            if entry.menu.items.isEmpty {
                Spacer()
                HStack {
                    Spacer()
                    Text("No menu for this day")
                        .font(.subheadline.bold())
                        .foregroundStyle(.tertiary)
                    Spacer()
                }
                Spacer()
            }
            
            if entry.menu.items.count > maxItems {
                divider
                Text("+\(entry.menu.items.count - maxItems + 1) more")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .contentTransition(.numericText())
            }
        }
    }
}

struct MensaSHWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily: WidgetFamily
    var entry: Provider.Entry
    
    var canteenNameFont: Font {
        switch widgetFamily {
        case .systemLarge, .systemExtraLarge:
            return .title3.bold()
        case .systemSmall, .systemMedium:
            return .headline
        default:
            return .headline
        }
    }
    
    var canteenNamePaddingTop: CGFloat {
        switch widgetFamily {
        case .systemLarge, .systemExtraLarge:
            return 0
        case .systemSmall, .systemMedium:
            return 0
        default:
            return 0
        }
    }
    
    var canteenNamePaddingBottom: CGFloat {
        switch widgetFamily {
        case .systemLarge, .systemExtraLarge:
            return 4
        case .systemSmall, .systemMedium:
            return 0
        default:
            return 0
        }
    }
    
    var maxItems: Int {
        switch widgetFamily {
        case .systemLarge, .systemExtraLarge:
            return 7
        case .systemSmall, .systemMedium:
            return 4
        default:
            return 4
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(entry.configuration.building.localizedShortDescription)
                    .font(canteenNameFont)
                    .lineLimit(1)
                    .foregroundStyle(LinearGradient(colors: [.teal, .green], startPoint: .leading, endPoint: .trailing))
                Spacer(minLength: 4)
                Text(entry.menu.date, format: .dateTime.month().day().weekday())
                    .font(.subheadline)
                    .contentTransition(.numericText())
            }
            .padding(.top, canteenNamePaddingTop)
            .padding(.bottom, canteenNamePaddingBottom)
            
            MensaSHWidgetList(entry: entry, maxItems: maxItems)
                .padding(.top, 6)
            
            Spacer(minLength: 0)
        }
    }
}

struct MensaSHWidget: Widget {
    let kind: String = "com.lukasobermann.MensaSH.MenuOfTheDay"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MensaSHWidgetEntryView(entry: entry)
                .padding([.horizontal, .top], 16)
                .padding(.bottom, 12)
                .containerBackground(.background, for: .widget)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Menu of the Day")
        .description("Display a canteen’s current or upcoming menu.")
#if !os(watchOS)
        .supportedFamilies([.systemLarge, .systemMedium])
#endif
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.building = .mensaFlensburg
        intent.priceCategory = .students
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.building = .mensaFlensburg
        intent.priceCategory = .students
        return intent
    }
}

#if !os(watchOS)
#Preview(as: .systemLarge) {
    MensaSHWidget()
} timeline: {
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[2], configuration: .smiley)
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[3], configuration: .starEyes)
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[4], configuration: .starEyes)
}

#Preview(as: .systemMedium) {
    MensaSHWidget()
} timeline: {
    SimpleEntry(
        date: .now,
        menu: MenuOfTheDay(
            date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
            items: [], announcements: []),
        configuration: .smiley
    )
    SimpleEntry(
        date: .now,
        menu: MenuOfTheDay(
            date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
            items: [
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name:
                                "Spaghetti with homemade pesto and fruity tomatoes marinated in balsamic vinegar",
                            additions: [
                                "1", "3", "5", "GlW", "Sw",
                            ])
                    ],
                    allergens: ["GlW", "Sw"],
                    additives: ["1", "3", "5"],
                    types: [],
                    prices: [2.35, 4.15, 4.85],
                    co2stars: 3),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name:
                                "Nasi goreng with marinated Planted.™ curry chicken chunks, colourful vegetables and fresh sprouts",
                            additions: [
                                "2", "GlW", "Se", "So",
                            ])
                    ],
                    allergens: ["GlW", "Se", "So"],
                    additives: ["2"],
                    types: ["SHT", "ve", "vn"],
                    prices: [2.5, 4.75, 5.45],
                    co2stars: 2),
            ], announcements: []),
        configuration: .smiley
    )
    SimpleEntry(
        date: .now,
        menu: MenuOfTheDay(
            date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
            items: [
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name:
                                "Spaghetti with homemade pesto and fruity tomatoes marinated in balsamic vinegar",
                            additions: [
                                "1", "3", "5", "GlW", "Sw",
                            ])
                    ], allergens: ["GlW", "Sw"],
                    additives: ["1", "3", "5"], types: [],
                    prices: [2.35, 4.15, 4.85],
                    co2stars: 3),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name:
                                "Nasi goreng with marinated Planted.™ curry chicken chunks, colourful vegetables and fresh sprouts",
                            additions: [
                                "2", "GlW", "Se", "So",
                            ])
                    ], allergens: ["GlW", "Se", "So"],
                    additives: ["2"], types: ["SHT", "ve", "vn"],
                    prices: [2.5, 4.75, 5.45], co2stars: 2
                ),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name: "Gold baked chicken crossies",
                            additions: ["GlW"]),
                        MenuOfTheDay.Item.NamePart(
                            name: "with fruity cocktail sauce",
                            additions: [
                                "3", "Ei", "GlW", "Sl",
                            ]),
                        MenuOfTheDay.Item.NamePart(
                            name: "and wedges", additions: []),
                    ], allergens: ["GlW", "Ei", "Sl"],
                    additives: ["3"], types: ["G", "STF"],
                    prices: [5.15, 5.15, 5.15],
                    co2stars: 2),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name: "Vegan Currywurst", additions: []
                        ),
                        MenuOfTheDay.Item.NamePart(
                            name: "Curry sauce",
                            additions: [
                                "2", "3", "Sf", "Sl",
                            ]),
                        MenuOfTheDay.Item.NamePart(
                            name: "and French fries", additions: []
                        ),
                    ], allergens: ["Sf", "Sl"],
                    additives: ["2", "3"], types: ["ve", "vn"],
                    prices: [4.9, 4.9, 4.9], co2stars: 3),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name:
                                "Potato gratin, peas, carrots, Gouda cheese",
                            additions: ["Ei", "Mi"])
                    ], allergens: ["Ei", "Mi"], additives: [],
                    types: ["ve"], prices: [3.6, 3.6, 3.6],
                    co2stars: 2),
                MenuOfTheDay.Item(
                    date: MenuOfTheDay.date(year: 2025, month: 1, day: 20),
                    name: [
                        MenuOfTheDay.Item.NamePart(
                            name: "Currywurst",
                            additions: ["10", "Sf"]),
                        MenuOfTheDay.Item.NamePart(
                            name: "Curry sauce",
                            additions: [
                                "2", "3", "Sf", "Sl",
                            ]),
                        MenuOfTheDay.Item.NamePart(
                            name: "and French fries", additions: []
                        ),
                    ], allergens: ["Sf", "Sl"],
                    additives: ["10", "2", "3"], types: ["AGS"],
                    prices: [5.3, 5.3, 5.3], co2stars: 3),
            ], announcements: []),
        configuration: .smiley
    )
}

#Preview(as: .systemMedium) {
    MensaSHWidget()
} timeline: {
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[2], configuration: .smiley)
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[3], configuration: .starEyes)
    SimpleEntry(date: .now, menu: MenuOfTheDay.examples[.flensburg(.mensa)]!.current[4], configuration: .starEyes)
}
#endif

//[
//    MenuOfTheDay(
//        date: date(year: 2025, month: 1, day: 20),
//        items: [
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Spaghetti with homemade pesto and fruity tomatoes marinated in balsamic vinegar",
//                        additions: [
//                            "1", "3", "5", "GlW", "Sw",
//                        ])
//                ], allergens: ["GlW", "Sw"],
//                additives: ["1", "3", "5"], types: [],
//                prices: [2.35, 4.15, 4.85],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Nasi goreng with marinated Planted.™ curry chicken chunks, colourful vegetables and fresh sprouts",
//                        additions: [
//                            "2", "GlW", "Se", "So",
//                        ])
//                ], allergens: ["GlW", "Se", "So"],
//                additives: ["2"], types: ["SHT", "ve", "vn"],
//                prices: [2.5, 4.75, 5.45], co2stars: 2
//            ),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Gold baked chicken crossies",
//                        additions: ["GlW"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "with fruity cocktail sauce",
//                        additions: [
//                            "3", "Ei", "GlW", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and wedges", additions: []),
//                ], allergens: ["GlW", "Ei", "Sl"],
//                additives: ["3"], types: ["G", "STF"],
//                prices: [5.15, 5.15, 5.15],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Vegan Currywurst", additions: []
//                    ),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["2", "3"], types: ["ve", "vn"],
//                prices: [4.9, 4.9, 4.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Potato gratin, peas, carrots, Gouda cheese",
//                        additions: ["Ei", "Mi"])
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["ve"], prices: [3.6, 3.6, 3.6],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 20),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Currywurst",
//                        additions: ["10", "Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["10", "2", "3"], types: ["AGS"],
//                prices: [5.3, 5.3, 5.3], co2stars: 3),
//        ], announcements: []),
//    MenuOfTheDay(
//        date: date(year: 2025, month: 1, day: 21),
//        items: [
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Potato-broccoli-gratin",
//                        additions: ["Ei", "Mi"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "with creamy cream cheese sauce",
//                        additions: ["Mi"]),
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["SHT", "ve"], prices: [2.5, 4.8, 5.5],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Chicken schnitzel cordon bleu",
//                        additions: [
//                            "1", "2", "3", "10", "12", "GlW",
//                            "Mi",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "with creamy mushroom sauce",
//                        additions: ["Mi"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and fried potatoes",
//                        additions: []),
//                ], allergens: ["GlW", "Mi"],
//                additives: ["1", "2", "3", "10", "12"],
//                types: ["G"], prices: [3.7, 5.5, 6.2],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Falafel plate with fresh salad,",
//                        additions: [
//                            "3", "5", "GlW", "Sw",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "and homemade plant-based tzatziki",
//                        additions: ["3", "Sf", "So"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and french fries", additions: []
//                    ),
//                ], allergens: ["GlW", "Sw", "Sf", "So"],
//                additives: ["3", "5"], types: ["STF"],
//                prices: [4.95, 4.95, 4.95],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Vegan Currywurst", additions: []
//                    ),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["2", "3"], types: ["ve", "vn"],
//                prices: [4.9, 4.9, 4.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Potato gratin, peas, carrots, Gouda cheese",
//                        additions: ["Ei", "Mi"])
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["ve"], prices: [3.6, 3.6, 3.6],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 21),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Currywurst",
//                        additions: ["10", "Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["10", "2", "3"], types: ["AGS"],
//                prices: [5.3, 5.3, 5.3], co2stars: 3),
//        ], announcements: []),
//    MenuOfTheDay(
//        date: date(year: 2025, month: 1, day: 22),
//        items: [
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Butter chick peas - Indian chickpea curry, opt. coriander",
//                        additions: ["Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and basmati rice", additions: []
//                    ),
//                ], allergens: ["Sf"], additives: [],
//                types: ["SHT", "ve", "vn"],
//                prices: [2.5, 4.75, 5.45], co2stars: 2
//            ),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Hearty pea stew with diced pork loin",
//                        additions: [
//                            "2", "3", "4", "5", "8", "10", "Sl",
//                            "Sw",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and Bockwurst",
//                        additions: [
//                            "2", "3", "10", "Sf",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "served with Baguette",
//                        additions: ["GlW"]),
//                ], allergens: ["Sl", "Sw", "Sf", "GlW"],
//                additives: ["2", "3", "4", "5", "8", "10"],
//                types: ["S"], prices: [3.4, 5.2, 5.9],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Plant-based crunchy chicken burger with tomato, iceberg lettuce, onions and salted tortilla chips",
//                        additions: [
//                            "GlW", "GlG", "GlD", "Sf", "So",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and Steakhouse fries",
//                        additions: []),
//                ],
//                allergens: ["GlW", "GlG", "GlD", "Sf", "So"],
//                additives: [], types: ["STF"],
//                prices: [5.95, 5.95, 5.95],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Vegan Currywurst", additions: []
//                    ),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["2", "3"], types: ["ve", "vn"],
//                prices: [4.9, 4.9, 4.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Potato gratin, peas, carrots, Gouda cheese",
//                        additions: ["Ei", "Mi"])
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["ve"], prices: [3.6, 3.6, 3.6],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 22),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Currywurst",
//                        additions: ["10", "Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["10", "2", "3"], types: ["AGS"],
//                prices: [5.3, 5.3, 5.3], co2stars: 3),
//        ], announcements: []),
//    MenuOfTheDay(
//        date: date(year: 2025, month: 1, day: 23),
//        items: [
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Pointed cabbage, minced soy",
//                        additions: ["1"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Tagliatelle",
//                        additions: ["GlW"]),
//                ], allergens: ["GlW"], additives: ["1"],
//                types: ["SHT", "ve", "vn"],
//                prices: [2.5, 5.2, 5.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Chicken Makhani - tender Indian butter chicken marinated with a spicy tomato and yoghurt sauce",
//                        additions: ["Mi", "NMn"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and basmati rice", additions: []
//                    ),
//                ], allergens: ["Mi", "NMn"], additives: [],
//                types: ["G", "BIO"],
//                prices: [3.65, 5.45, 6.15],
//                co2stars: 1),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Dürüm with gyros and fresh salad and french fries",
//                        additions: ["2", "GlW"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "and homemade plant-based tzatziki",
//                        additions: ["3", "Sf", "So"]),
//                ], allergens: ["GlW", "Sf", "So"],
//                additives: ["2", "3"], types: ["S", "STF"],
//                prices: [5.15, 5.15, 5.15],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Dürüm with Planted.™ kebab, fresh salad and french fries",
//                        additions: ["2", "GlW"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "and homemade plant-based tzatziki",
//                        additions: ["3", "Sf", "So"]),
//                ], allergens: ["GlW", "Sf", "So"],
//                additives: ["2", "3"], types: ["STF"],
//                prices: [5.15, 5.15, 5.15],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Vegan Currywurst", additions: []
//                    ),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["2", "3"], types: ["ve", "vn"],
//                prices: [4.9, 4.9, 4.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Potato gratin, peas, carrots, Gouda cheese",
//                        additions: ["Ei", "Mi"])
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["ve"], prices: [3.6, 3.6, 3.6],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 23),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Currywurst",
//                        additions: ["10", "Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["10", "2", "3"], types: ["AGS"],
//                prices: [5.3, 5.3, 5.3], co2stars: 3),
//        ], announcements: []),
//    MenuOfTheDay(
//        date: date(year: 2025, month: 1, day: 24),
//        items: [
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Planted.™ Chicken Alfredo on pasta with cauliflower-cashew sauce",
//                        additions: [
//                            "GlW", "GlH", "NC", "Sf", "So",
//                        ])
//                ], allergens: ["GlW", "GlH", "NC", "Sf", "So"],
//                additives: [], types: ["A", "SHT", "ve", "vn"],
//                prices: [2.5, 4.7, 5.4], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Creamy red lentil dal with soya yoghurt, optional coriander",
//                        additions: ["3", "So"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "with Naan bread",
//                        additions: ["GlW", "So"]),
//                ], allergens: ["So", "GlW"], additives: ["3"],
//                types: [], prices: [3.55, 5.35, 6.05],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Crispy saithe fillet from the oven (with lemon)",
//                        additions: [
//                            "Fi", "GlW", "Mi", "Sf",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "homemade remoulade sauce",
//                        additions: [
//                            "3", "8", "Ei", "GlW", "Mi", "Sf",
//                            "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ],
//                allergens: [
//                    "Fi", "GlW", "Mi", "Sf", "Ei", "Sl",
//                ], additives: ["3", "8"], types: ["STF"],
//                prices: [4.75, 4.75, 4.75],
//                co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Vegan Currywurst", additions: []
//                    ),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["2", "3"], types: ["ve", "vn"],
//                prices: [4.9, 4.9, 4.9], co2stars: 3),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name:
//                            "Potato gratin, peas, carrots, Gouda cheese",
//                        additions: ["Ei", "Mi"])
//                ], allergens: ["Ei", "Mi"], additives: [],
//                types: ["ve"], prices: [3.6, 3.6, 3.6],
//                co2stars: 2),
//            MenuOfTheDay.Item(
//                date: date(year: 2025, month: 1, day: 24),
//                name: [
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Currywurst",
//                        additions: ["10", "Sf"]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "Curry sauce",
//                        additions: [
//                            "2", "3", "Sf", "Sl",
//                        ]),
//                    MenuOfTheDay.Item.NamePart(
//                        name: "and French fries", additions: []
//                    ),
//                ], allergens: ["Sf", "Sl"],
//                additives: ["10", "2", "3"], types: ["AGS"],
//                prices: [5.3, 5.3, 5.3], co2stars: 3),
//        ], announcements: []),
//]
