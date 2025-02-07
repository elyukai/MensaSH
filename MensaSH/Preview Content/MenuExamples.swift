//
//  MenuExamples.swift
//  MensaSH
//
//  Created by Lukas Obermann on 01.02.25.
//

import Foundation

extension MenuOfTheDay {
    static func date(year: Int, month: Int, day: Int) -> Date {
        DateComponents(
            calendar: .current, timeZone: .init(identifier: "Europe/Berlin")!,
            year: year, month: month, day: day, hour: 0, minute: 0, second: 0
        ).date!
    }

    static let examples:
        [Location: (current: [MenuOfTheDay], next: [MenuOfTheDay])] = [
            Location.kiel(.mensa1): (
                current: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 20),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Pasta with homemade pesto and fruity tomatoes marinated in balsamic vinegar",
                                        additions: [
                                            "1", "3", "5", "GlW", "NW", "Sw",
                                        ])
                                ], allergens: ["GlW", "NW", "Sw"],
                                additives: ["1", "3", "5"],
                                types: ["ve", "vn"],
                                prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Nasi goreng with marinated Planted.™ curry chicken chunks, colourful vegetables and fresh sprouts",
                                        additions: [
                                            "2", "GlW", "Se", "Sf", "So",
                                        ])
                                ], allergens: ["GlW", "Se", "Sf", "So"],
                                additives: ["2"], types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.75, 5.45], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Vegetarian schnitzel, mediterranean filling",
                                        additions: [
                                            "Ei", "GlW", "GlH", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Couscous",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with homemade yoghurt [bio] lemon and mint dip",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "GlW", "GlH", "Mi"],
                                additives: [], types: ["ve", "BIO"],
                                prices: [3.95, 5.75, 6.45],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Limited offer", additions: []),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Fish from the field in batter",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with homemade veganese with peas, cucumber, ginger and fresh herbs.",
                                        additions: ["Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with golden roast potatoes",
                                        additions: []),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: [], types: ["STF", "ve", "vn"],
                                prices: [4.15, 4.15, 4.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Soya Bolognese",
                                        additions: ["GlG", "So"]),
                                ], allergens: ["GlW", "Mi", "GlG", "So"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, red cabbage, beef goulash",
                                        additions: ["3", "8"])
                                ], allergens: [], additives: ["3", "8"],
                                types: ["R"], prices: [5.2, 5.2, 5.2],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin “greek style” Olives, peppers, shepherd\'s cheese",
                                        additions: ["6", "Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: ["6"],
                                types: ["ve"], prices: [3.95, 3.95, 3.95],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "With every changing dish of the day there is a Fritz drink for the special price of 1,65€ in additio",
                                        additions: [])
                                ], allergens: [], additives: [], types: [],
                                prices: [], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ vegan curry sausage with curry sauce and french fries",
                                        additions: ["Sl", "3"])
                                ], allergens: ["Sl"], additives: ["3"],
                                types: ["ve", "vn"], prices: [4.9, 4.9, 4.9],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Currywurst",
                                        additions: ["10", "Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Curry sauce",
                                        additions: ["3", "Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["Sf", "Sl"],
                                additives: ["10", "3"], types: ["AGS"],
                                prices: [5.3, 5.3, 5.3], co2stars: nil),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 21),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mercimek Çorbasi - Spicy Turkish lentil soup",
                                        additions: ["1", "GlW", "Se"])
                                ], allergens: ["GlW", "Se"], additives: ["1"],
                                types: ["ve", "vn"],
                                prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Potato-broccoli-gratin",
                                        additions: ["Ei", "Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy cream cheese sauce",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["SHT", "ve"], prices: [2.5, 4.8, 5.5],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Chicken schnitzel cordon bleu",
                                        additions: [
                                            "1", "2", "3", "10", "12", "GlW",
                                            "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy mushroom sauce",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and fried potatoes",
                                        additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2", "3", "10", "12"],
                                types: ["G"], prices: [3.7, 5.5, 6.2],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Falafel plate with fresh salad,",
                                        additions: [
                                            "3", "5", "GlW", "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and french fries", additions: []
                                    ),
                                ], allergens: ["GlW", "Sw", "Sf", "So"],
                                additives: ["3", "5"],
                                types: ["STF", "ve", "vn"],
                                prices: [4.95, 4.95, 4.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Couscous salad",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Yogurt [bio]- mint- dip",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and grilled chicken",
                                        additions: ["GlW", "Sf"]),
                                ], allergens: ["GlW", "Mi", "Sf"],
                                additives: ["2"], types: ["G", "BIO"],
                                prices: [4.8, 4.8, 4.8], co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Couscous salad",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Yogurt [bio]- mint- dip",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with falafel",
                                        additions: ["GlW"]),
                                ], allergens: ["GlW", "Mi"], additives: ["2"],
                                types: ["ve", "BIO"], prices: [4.4, 4.4, 4.4],
                                co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "With every changing dish of the day there is a Fritz drink for the special price of 1,65€ in additio",
                                        additions: [])
                                ], allergens: [], additives: [], types: [],
                                prices: [], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ vegan curry sausage with curry sauce and french fries",
                                        additions: ["Sl", "3"])
                                ], allergens: ["Sl"], additives: ["3"],
                                types: ["ve", "vn"], prices: [4.9, 4.9, 4.9],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Currywurst",
                                        additions: ["10", "Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Curry sauce",
                                        additions: ["3", "Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["Sf", "Sl"],
                                additives: ["10", "3"], types: ["AGS"],
                                prices: [5.3, 5.3, 5.3], co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 22),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Butter chick peas - Indian chickpea curry, opt. coriander",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Sf"], additives: [],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.75, 5.45], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Sicilian pasta alla Norma with fried aubergine, fruity tomatoes and fresh basil",
                                        additions: ["1", "2", "GlW"])
                                ], allergens: ["GlW"], additives: ["1", "2"],
                                types: ["ve", "vn"],
                                prices: [3.75, 5.55, 6.25],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Hearty pea stew with diced pork loin",
                                        additions: [
                                            "2", "3", "5", "Sl", "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Sl", "Sw", "Sf", "GlW"],
                                additives: ["2", "3", "5", "10"], types: ["S"],
                                prices: [3.4, 5.2, 5.9], co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plant-based crunchy chicken burger with tomato, iceberg lettuce, onions and salted tortilla chips",
                                        additions: [
                                            "GlW", "GlG", "GlD", "Sf", "So",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "served with colourful french fries",
                                        additions: ["GlW"]),
                                ],
                                allergens: ["GlW", "GlG", "GlD", "Sf", "So"],
                                additives: [], types: ["STF", "ve", "vn"],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mac \'n cheese gratin, couliflower, Gouda cheese",
                                        additions: ["1", "GlW", "Mi"])
                                ], allergens: ["GlW", "Mi"], additives: ["1"],
                                types: ["ve"], prices: [3.5, 3.5, 3.5],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "With every changing dish of the day there is a Fritz drink for the special price of 1,65€ in additio",
                                        additions: [])
                                ], allergens: [], additives: [], types: [],
                                prices: [], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ vegan curry sausage with curry sauce and french fries",
                                        additions: ["Sl", "3"])
                                ], allergens: ["Sl"], additives: ["3"],
                                types: ["ve", "vn"], prices: [4.9, 4.9, 4.9],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Currywurst",
                                        additions: ["10", "Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Curry sauce",
                                        additions: ["3", "Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["Sf", "Sl"],
                                additives: ["10", "3"], types: ["AGS"],
                                prices: [5.3, 5.3, 5.3], co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 23),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pointed cabbage, minced soy",
                                        additions: ["1", "GlG", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Tagliatelle",
                                        additions: ["GlW"]),
                                ], allergens: ["GlG", "So", "GlW"],
                                additives: ["1"], types: ["SHT", "ve", "vn"],
                                prices: [2.5, 5.2, 5.9], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Colourful sweet potato, beetroot and spinach gnocchi with sunflower seeds and fresh sage",
                                        additions: []),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with homemade rocket pesto",
                                        additions: []),
                                ], allergens: [], additives: [],
                                types: ["ve", "vn"],
                                prices: [3.85, 5.65, 6.35],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken Makhani - tender Indian butter chicken marinated with a spicy tomato and yog",
                                        additions: ["Mi", "NMn"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Mi", "NMn"], additives: [],
                                types: ["G", "IN", "BIO"],
                                prices: [3.65, 5.45, 6.15],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with gyros and fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with Planted.™ kebab, fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"],
                                types: ["STF", "ve", "vn"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pork schnitzel",
                                        additions: ["Ei", "GlW", "Mi"]
                                    ),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Potato salad",
                                        additions: ["Ei", "Sf"]),
                                ], allergens: ["Ei", "GlW", "Mi", "Sf"],
                                additives: [], types: ["S"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Planted.™ schnitzel",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Vegan potato salad",
                                        additions: ["Sf"]),
                                ], allergens: ["GlW", "Sf"], additives: [],
                                types: ["ve", "vn"],
                                prices: [5.35, 5.35, 5.35],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "With every changing dish of the day there is a Fritz drink for the special price of 1,65€ in additio",
                                        additions: [])
                                ], allergens: [], additives: [], types: [],
                                prices: [], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ vegan curry sausage with curry sauce and french fries",
                                        additions: ["Sl", "3"])
                                ], allergens: ["Sl"], additives: ["3"],
                                types: ["ve", "vn"], prices: [4.9, 4.9, 4.9],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Currywurst",
                                        additions: ["10", "Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Curry sauce",
                                        additions: ["3", "Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["Sf", "Sl"],
                                additives: ["10", "3"], types: ["AGS"],
                                prices: [5.3, 5.3, 5.3], co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 24),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ Chicken Alfredo on pasta with cauliflower-cashew sauce",
                                        additions: [
                                            "GlW", "GlH", "NC", "Sf", "So",
                                        ])
                                ], allergens: ["GlW", "GlH", "NC", "Sf", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.7, 5.4], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Creamy red lentil dal with soya yoghurt, optional coriander",
                                        additions: ["3", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Naan bread",
                                        additions: ["GlW", "So"]),
                                ], allergens: ["So", "GlW"], additives: ["3"],
                                types: ["ve", "vn"],
                                prices: [3.55, 5.35, 6.05],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy saithe fillet from the oven (with lemon)",
                                        additions: [
                                            "Fi", "GlW", "Mi", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "homemade remoulade sauce",
                                        additions: [
                                            "3", "8", "Ei", "GlW", "Mi", "Sf",
                                            "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ],
                                allergens: [
                                    "Fi", "GlW", "Mi", "Sf", "Ei", "Sl",
                                ], additives: ["3", "8"], types: ["STF"],
                                prices: [4.75, 4.75, 4.75],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ])
                                ], allergens: ["Sf", "Ei"],
                                additives: ["2", "3", "10"], types: ["S"],
                                prices: [4, 4, 4], co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "With every changing dish of the day there is a Fritz drink for the special price of 1,65€ in additio",
                                        additions: [])
                                ], allergens: [], additives: [], types: [],
                                prices: [], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ vegan curry sausage with curry sauce and french fries",
                                        additions: ["Sl", "3"])
                                ], allergens: ["Sl"], additives: ["3"],
                                types: ["ve", "vn"], prices: [4.9, 4.9, 4.9],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Currywurst",
                                        additions: ["10", "Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Curry sauce",
                                        additions: ["3", "Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["Sf", "Sl"],
                                additives: ["10", "3"], types: ["AGS"],
                                prices: [5.3, 5.3, 5.3], co2stars: 3),
                        ], announcements: []),
                ],
                next: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 27),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mie noodles with fresh pak choi, carrots and lime in a spicy peanut butter sauce, opti. coriande",
                                        additions: [
                                            "En", "GlW", "Se", "So",
                                        ])
                                ], allergens: ["En", "GlW", "Se", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Gratin with swede, potato and carrot, served with creamy herb dip",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: [], prices: [3.25, 5.05, 5.75],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "2 organic poultry sausages",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with Sauerkraut and mashed potatoes",
                                        additions: ["Mi"]),
                                ], allergens: ["Sf", "Mi"], additives: [],
                                types: ["AGG"], prices: [4.2, 6, 6.7],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plantbased, golden baked nuggets",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with fruity cocktail sauce",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and wedges", additions: []),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["3"], types: ["STF", "ve", "vn"],
                                prices: [3.85, 3.85, 3.85],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 28),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Green bean stew",
                                        additions: ["Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Sl", "GlW"], additives: [],
                                types: [], prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Sabsi - Indian Brussels sprouts curry with chickpeas, coconut milk and basmati rice. Opt. coriander",
                                        additions: [])
                                ], allergens: [], additives: [],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ])
                                ], allergens: ["Sf"],
                                additives: ["2", "3", "10"], types: ["S"],
                                prices: [1.45, 1.65, 1.75],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato-kale-casserole with boiled sausage",
                                        additions: [
                                            "1", "2", "3", "4", "8", "10", "Ei",
                                            "Mi", "Sf", "Sl",
                                        ])
                                ], allergens: ["Ei", "Mi", "Sf", "Sl"],
                                additives: ["1", "2", "3", "4", "8", "10"],
                                types: ["R", "S"], prices: [4.1, 5.9, 6.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice salami",
                                        additions: [
                                            "2", "3", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["GlW", "Mi", "Sf"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [3.05, 3.05, 3.05],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza verdura",
                                        additions: ["GlW", "Mi", "Sl"]
                                    )
                                ], allergens: ["GlW", "Mi", "Sl"],
                                additives: [], types: ["STF", "ve"],
                                prices: [3.5, 3.5, 3.5], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice Margherita",
                                        additions: ["GlW", "Mi"])
                                ], allergens: ["GlW", "Mi"], additives: [],
                                types: ["STF", "ve"], prices: [2.9, 2.9, 2.9],
                                co2stars: 2),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 29),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Pasta bake with broccoli, mushrooms and herb crust",
                                        additions: [
                                            "1", "2", "GlW", "GlH",
                                        ])
                                ], allergens: ["GlW", "GlH"],
                                additives: ["1", "2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Bun Chay - Vietnamese rice noodle bowl with tofu, lettuce, cucumber, apple, fried onions, peanut",
                                        additions: [
                                            "1", "2", "4", "En", "GlW", "So",
                                        ])
                                ], allergens: ["En", "GlW", "So"],
                                additives: ["1", "2", "4"], types: [],
                                prices: [3.75, 5.55, 6.25],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken breast with mediterranean ratatouille and Gnocchi",
                                        additions: ["Ei"])
                                ], allergens: ["Ei"], additives: [],
                                types: ["G"], prices: [3.55, 5.35, 6.05],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Flaming Hot Plant based burger with creamy chili cheese sauce, jalapenos, tomato",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and french fries", additions: []
                                    ),
                                ], allergens: ["GlW", "So"],
                                additives: ["1", "2"],
                                types: ["STF", "ve", "vn"],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 30),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Spicy Arabic chickpea soup with sweet potato, paprika and fresh mint",
                                        additions: ["2", "Se"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Se", "GlW"], additives: ["2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.4, 5.1], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Roasted Hokkaido pumpkin and gnocchi",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with pesto", additions: []),
                                ], allergens: ["GlW"], additives: [], types: [],
                                prices: [3.5, 5.3, 6], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Holstein turnips puree with bacon dripping",
                                        additions: [
                                            "1", "2", "3", "4", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and cooked sausage",
                                        additions: [
                                            "1", "2", "10", "Sf",
                                        ]),
                                ], allergens: ["Sf"],
                                additives: ["1", "2", "3", "4", "10"],
                                types: ["S"], prices: [3.6, 5.4, 6.1],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Lahmacun with fresh salad",
                                        additions: ["GlW", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and tomato salsa",
                                        additions: ["Sw"]),
                                ], allergens: ["GlW", "So", "Sw"],
                                additives: [],
                                types: ["STF", "IN", "ve", "vn"],
                                prices: [4.45, 4.45, 4.45],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 31),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Phat Krapao - Mie noodles with spicy Thai soya mince sauce and lime leaves, opt. coriander",
                                        additions: [
                                            "1", "2", "4", "GlW", "So",
                                        ])
                                ], allergens: ["GlW", "So"],
                                additives: ["1", "2", "4"],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Fried pan-fried fish with mustard sauce and fried potatoes",
                                        additions: [
                                            "2", "8", "Fi", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["Fi", "GlW", "Mi", "Sf"],
                                additives: ["2", "8"], types: [],
                                prices: [4.15, 5.95, 6.65],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy börek stick with spinach filling",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and couscous",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with tomato-mint-sugo",
                                        additions: []),
                                ], allergens: ["GlW"], additives: [],
                                types: ["STF", "IN", "ve", "vn"],
                                prices: [3.25, 3.25, 3.25],
                                co2stars: 3),
                        ], announcements: []),
                ]
            ),
            Location.flensburg(Location.LocationInFlensburg.cafeteria): (
                current: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 20),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 21),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
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
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 22),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
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
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 23),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
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
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 24),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
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
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
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
                ],
                next: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 27),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
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
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 28),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
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
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 29),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
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
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 30),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
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
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 31),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
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
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
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
                ]
            ),
            Location.kiel(.mensaSchwentine): (
                current: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 20),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Vegetarian schnitzel, mediterranean filling",
                                        additions: [
                                            "Ei", "GlW", "GlH", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Couscous",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with homemade yoghurt lemon and mint dip",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "GlW", "GlH", "Mi"],
                                additives: [], types: ["ve"],
                                prices: [3.95, 5.75, 6.45],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 21),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mercimek Çorbasi - Spicy Turkish lentil soup",
                                        additions: ["1", "GlW", "Se"])
                                ], allergens: ["GlW", "Se"], additives: ["1"],
                                types: ["vn"], prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Potato-broccoli-gratin",
                                        additions: ["Ei", "Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy cream cheese sauce",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["SHT", "ve"], prices: [2.5, 4.8, 5.5],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Chicken schnitzel cordon bleu",
                                        additions: [
                                            "1", "2", "3", "10", "12", "GlW",
                                            "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy mushroom sauce",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and fried potatoes",
                                        additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2", "3", "10", "12"],
                                types: ["G"], prices: [3.7, 5.5, 6.2],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Falafel plate with fresh salad,",
                                        additions: [
                                            "3", "5", "GlW", "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and french fries", additions: []
                                    ),
                                ], allergens: ["GlW", "Sw", "Sf", "So"],
                                additives: ["3", "5"], types: ["vn", "STF"],
                                prices: [4.95, 4.95, 4.95],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 22),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Butter chick peas - Indian chickpea curry, opt. coriander",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Sf"], additives: [],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.75, 5.45], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Sicilian pasta alla Norma with fried aubergine, fruity tomatoes and fresh basil",
                                        additions: ["1", "2", "GlW"])
                                ], allergens: ["GlW"], additives: ["1", "2"],
                                types: ["vn"], prices: [3.75, 5.55, 6.25],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Hearty pea stew with diced pork loin",
                                        additions: [
                                            "2", "3", "4", "5", "8", "10", "Sl",
                                            "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Sl", "Sw", "Sf", "GlW"],
                                additives: ["2", "3", "4", "5", "8", "10"],
                                types: ["S"], prices: [3.4, 5.2, 5.9],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plant-based crunchy chicken burger with tomato, iceberg lettuce, onions and salted tortilla chips",
                                        additions: [
                                            "GlW", "GlG", "GlD", "Sf", "So",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "served with colourful french fries",
                                        additions: ["GlW"]),
                                ],
                                allergens: ["GlW", "GlG", "GlD", "Sf", "So"],
                                additives: [], types: ["vn", "STF"],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 23),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pointed cabbage, minced soy",
                                        additions: ["1"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Tagliatelle",
                                        additions: ["GlW"]),
                                ], allergens: ["GlW"], additives: ["1"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 5.2, 5.9], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken Makhani - tender Indian butter chicken marinated with a spicy tomato and yoghurt sauce",
                                        additions: ["Mi", "NMn"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Mi", "NMn"], additives: [],
                                types: ["G", "BIO"],
                                prices: [3.65, 5.45, 6.15],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with gyros and fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with Planted.™ kebab, fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"], types: ["vn", "STF"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 24),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ Chicken Alfredo on pasta with cauliflower-cashew sauce",
                                        additions: [
                                            "GlW", "GlH", "NC", "Sf", "So",
                                        ])
                                ], allergens: ["GlW", "GlH", "NC", "Sf", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.7, 5.4], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Creamy red lentil dal with soya yoghurt, optional coriander",
                                        additions: ["3", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Naan bread",
                                        additions: ["GlW", "So"]),
                                ], allergens: ["So", "GlW"], additives: ["3"],
                                types: ["vn"], prices: [3.55, 5.35, 6.05],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy saithe fillet from the oven (with lemon)",
                                        additions: [
                                            "Fi", "GlW", "Mi", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "homemade remoulade sauce",
                                        additions: [
                                            "3", "8", "Ei", "GlW", "Mi", "Sf",
                                            "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ],
                                allergens: [
                                    "Fi", "GlW", "Mi", "Sf", "Ei", "Sl",
                                ], additives: ["3", "8"], types: ["STF"],
                                prices: [4.75, 4.75, 4.75],
                                co2stars: 3),
                        ], announcements: []),
                ],
                next: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 27),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mie noodles with fresh pak choi, carrots and lime in a spicy peanut butter sauce, opti. coriande",
                                        additions: [
                                            "En", "GlW", "Se", "So",
                                        ])
                                ], allergens: ["En", "GlW", "Se", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Gratin with swede, potato and carrot, served with creamy herb dip",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: [], prices: [3.25, 5.05, 5.75],
                                co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "2 organic poultry sausages",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with Sauerkraut and mashed potatoes",
                                        additions: ["Mi"]),
                                ], allergens: ["Sf", "Mi"], additives: [],
                                types: ["AGG"], prices: [4.2, 6, 6.7],
                                co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plantbased, golden baked nuggets",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with fruity cocktail sauce",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and wedges", additions: []),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["3"], types: ["STF"],
                                prices: [3.85, 3.85, 3.85], co2stars: nil),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 28),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Green bean stew",
                                        additions: ["Sl"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Sl", "GlW"], additives: [],
                                types: [], prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Sabsi - Indian Brussels sprouts curry with chickpeas, coconut milk and basmati rice. Opt. coriander",
                                        additions: [])
                                ], allergens: [], additives: [],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ])
                                ], allergens: ["Sf"],
                                additives: ["2", "3", "10"], types: ["S"],
                                prices: [1.45, 1.65, 1.75],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato-kale-casserole with boiled sausage",
                                        additions: [
                                            "1", "2", "3", "4", "8", "10", "Ei",
                                            "Mi", "Sf", "Sl",
                                        ])
                                ], allergens: ["Ei", "Mi", "Sf", "Sl"],
                                additives: ["1", "2", "3", "4", "8", "10"],
                                types: ["R", "S"], prices: [4.1, 5.9, 6.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice salami",
                                        additions: [
                                            "2", "3", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["GlW", "Mi", "Sf"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [3.05, 3.05, 3.05], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza verdura",
                                        additions: ["GlW", "Mi", "Sl"]
                                    )
                                ], allergens: ["GlW", "Mi", "Sl"],
                                additives: [], types: ["STF"],
                                prices: [3.5, 3.5, 3.5], co2stars: nil),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice Margherita",
                                        additions: ["GlW", "Mi"])
                                ], allergens: ["GlW", "Mi"], additives: [],
                                types: ["STF"], prices: [2.9, 2.9, 2.9],
                                co2stars: nil),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 29),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Pasta bake with broccoli, mushrooms and herb crust",
                                        additions: [
                                            "1", "2", "GlW", "GlH",
                                        ])
                                ], allergens: ["GlW", "GlH"],
                                additives: ["1", "2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Bun Chay - Vietnamese rice noodle bowl with tofu, lettuce, cucumber, apple, fried onions, peanut",
                                        additions: [
                                            "1", "2", "4", "En", "GlW", "So",
                                        ])
                                ], allergens: ["En", "GlW", "So"],
                                additives: ["1", "2", "4"], types: [],
                                prices: [3.75, 5.55, 6.25],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken breast with mediterranean ratatouille and Gnocchi",
                                        additions: ["Ei"])
                                ], allergens: ["Ei"], additives: [],
                                types: ["G"], prices: [3.55, 5.35, 6.05],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Flaming Hot Plant based burger with creamy chili cheese sauce, jalapenos, tomato",
                                        additions: ["GlW"])
                                ], allergens: ["GlW"], additives: [],
                                types: ["STF"], prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 30),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Spicy Arabic chickpea soup with sweet potato, paprika and fresh mint",
                                        additions: ["2", "Se"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Se", "GlW"], additives: ["2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.4, 5.1], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Roasted Hokkaido pumpkin and gnocchi",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with pesto", additions: []),
                                ], allergens: ["GlW"], additives: [], types: [],
                                prices: [3.5, 5.3, 6], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Holstein turnips puree with bacon dripping",
                                        additions: [
                                            "1", "2", "3", "4", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and cooked sausage",
                                        additions: [
                                            "1", "2", "10", "Sf",
                                        ]),
                                ], allergens: ["Sf"],
                                additives: ["1", "2", "3", "4", "10"],
                                types: ["S"], prices: [3.6, 5.4, 6.1],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Lahmacun with fresh salad",
                                        additions: ["GlW", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and tomato salsa",
                                        additions: ["Sw"]),
                                ], allergens: ["GlW", "So", "Sw"],
                                additives: [], types: ["STF"],
                                prices: [4.45, 4.45, 4.45],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 31),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Phat Krapao - Mie noodles with spicy Thai soya mince sauce and lime leaves, opt. coriander",
                                        additions: [
                                            "1", "2", "4", "GlW", "So",
                                        ])
                                ], allergens: ["GlW", "So"],
                                additives: ["1", "2", "4"],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "pasta meets superfood: penne with spicy kale and pumpkin seed pesto",
                                        additions: [
                                            "GlW", "NMn", "NC",
                                        ])
                                ], allergens: ["GlW", "NMn", "NC"],
                                additives: [], types: [],
                                prices: [2.9, 4.7, 5.4], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Fried pan-fried fish with mustard sauce and fried potatoes",
                                        additions: [
                                            "2", "8", "Fi", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["Fi", "GlW", "Mi", "Sf"],
                                additives: ["2", "8"], types: [],
                                prices: [4.15, 5.95, 6.65],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy börek stick with spinach filling",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and couscous",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with tomato-mint-sugo",
                                        additions: []),
                                ], allergens: ["GlW"], additives: [],
                                types: ["STF"], prices: [3.25, 3.25, 3.25],
                                co2stars: 3),
                        ], announcements: []),
                ]
            ),
            Location.flensburg(Location.LocationInFlensburg.mensa): (
                current: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 20),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 21),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Potato-broccoli-gratin",
                                        additions: ["Ei", "Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy cream cheese sauce",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["SHT", "ve"], prices: [2.5, 4.8, 5.5],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Chicken schnitzel cordon bleu",
                                        additions: [
                                            "1", "2", "3", "10", "12", "GlW",
                                            "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy mushroom sauce",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and fried potatoes",
                                        additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2", "3", "10", "12"],
                                types: ["G"], prices: [3.7, 5.5, 6.2],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Falafel plate with fresh salad,",
                                        additions: [
                                            "3", "5", "GlW", "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and french fries", additions: []
                                    ),
                                ], allergens: ["GlW", "Sw", "Sf", "So"],
                                additives: ["3", "5"], types: ["STF"],
                                prices: [4.95, 4.95, 4.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
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
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 22),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Butter chick peas - Indian chickpea curry, opt. coriander",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Sf"], additives: [],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.75, 5.45], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Hearty pea stew with diced pork loin",
                                        additions: [
                                            "2", "3", "4", "5", "8", "10", "Sl",
                                            "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Sl", "Sw", "Sf", "GlW"],
                                additives: ["2", "3", "4", "5", "8", "10"],
                                types: ["S"], prices: [3.4, 5.2, 5.9],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plant-based crunchy chicken burger with tomato, iceberg lettuce, onions and salted tortilla chips",
                                        additions: [
                                            "GlW", "GlG", "GlD", "Sf", "So",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and Steakhouse fries",
                                        additions: []),
                                ],
                                allergens: ["GlW", "GlG", "GlD", "Sf", "So"],
                                additives: [], types: ["STF"],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
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
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 23),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pointed cabbage, minced soy",
                                        additions: ["1"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Tagliatelle",
                                        additions: ["GlW"]),
                                ], allergens: ["GlW"], additives: ["1"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 5.2, 5.9], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken Makhani - tender Indian butter chicken marinated with a spicy tomato and yoghurt sauce",
                                        additions: ["Mi", "NMn"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Mi", "NMn"], additives: [],
                                types: ["G", "BIO"],
                                prices: [3.65, 5.45, 6.15],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with gyros and fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Dürüm with Planted.™ kebab, fresh salad and french fries",
                                        additions: ["2", "GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["2", "3"], types: ["STF"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
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
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 24),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ Chicken Alfredo on pasta with cauliflower-cashew sauce",
                                        additions: [
                                            "GlW", "GlH", "NC", "Sf", "So",
                                        ])
                                ], allergens: ["GlW", "GlH", "NC", "Sf", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.7, 5.4], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Creamy red lentil dal with soya yoghurt, optional coriander",
                                        additions: ["3", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Naan bread",
                                        additions: ["GlW", "So"]),
                                ], allergens: ["So", "GlW"], additives: ["3"],
                                types: [], prices: [3.55, 5.35, 6.05],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy saithe fillet from the oven (with lemon)",
                                        additions: [
                                            "Fi", "GlW", "Mi", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "homemade remoulade sauce",
                                        additions: [
                                            "3", "8", "Ei", "GlW", "Mi", "Sf",
                                            "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ],
                                allergens: [
                                    "Fi", "GlW", "Mi", "Sf", "Ei", "Sl",
                                ], additives: ["3", "8"], types: ["STF"],
                                prices: [4.75, 4.75, 4.75],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
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
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
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
                ],
                next: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 27),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Mie noodles with fresh pak choi, carrots and lime in a spicy peanut butter sauce, opti. coriande",
                                        additions: [
                                            "En", "GlW", "Se", "So",
                                        ])
                                ], allergens: ["En", "GlW", "Se", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "2 organic poultry sausages",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "with Sauerkraut and mashed potatoes",
                                        additions: ["Mi"]),
                                ], allergens: ["Sf", "Mi"], additives: [],
                                types: ["AGG"], prices: [4.2, 6, 6.7],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plantbased, golden baked nuggets",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with fruity cocktail sauce",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and wedges", additions: []),
                                ], allergens: ["GlW", "Sf", "So"],
                                additives: ["3"], types: [],
                                prices: [3.85, 3.85, 3.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
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
                                date: date(year: 2025, month: 1, day: 27),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 27),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 28),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Sabsi - Indian Brussels sprouts curry with chickpeas, coconut milk and basmati rice. Opt. coriander",
                                        additions: [])
                                ], allergens: [], additives: [],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Bockwurst",
                                        additions: [
                                            "2", "3", "10", "Sf",
                                        ])
                                ], allergens: ["Sf"],
                                additives: ["2", "3", "10"], types: ["S"],
                                prices: [1.45, 1.65, 1.75],
                                co2stars: 4),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato-kale-casserole with boiled sausage",
                                        additions: [
                                            "1", "2", "3", "4", "8", "10", "Ei",
                                            "Mi", "Sf", "Sl",
                                        ])
                                ], allergens: ["Ei", "Mi", "Sf", "Sl"],
                                additives: ["1", "2", "3", "4", "8", "10"],
                                types: ["R", "S"], prices: [4.1, 5.9, 6.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice salami",
                                        additions: [
                                            "2", "3", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["GlW", "Mi", "Sf"],
                                additives: ["2", "3"], types: ["S", "STF"],
                                prices: [3.05, 3.05, 3.05],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza verdura",
                                        additions: ["GlW", "Mi", "Sl"]
                                    )
                                ], allergens: ["GlW", "Mi", "Sl"],
                                additives: [], types: ["STF"],
                                prices: [3.5, 3.5, 3.5], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pizza slice Margherita",
                                        additions: ["GlW", "Mi"])
                                ], allergens: ["GlW", "Mi"], additives: [],
                                types: ["STF"], prices: [2.9, 2.9, 2.9],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
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
                                date: date(year: 2025, month: 1, day: 28),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 28),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 29),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Pasta bake with broccoli, mushrooms and herb crust",
                                        additions: [
                                            "1", "2", "GlW", "GlH",
                                        ])
                                ], allergens: ["GlW", "GlH"],
                                additives: ["1", "2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken breast with mediterranean ratatouille and Gnocchi",
                                        additions: ["Ei"])
                                ], allergens: ["Ei"], additives: [],
                                types: ["G"], prices: [3.55, 5.35, 6.05],
                                co2stars: 1),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Flaming Hot Plant based burger with creamy chili cheese sauce, jalapenos, tomato",
                                        additions: ["GlW"])
                                ], allergens: ["GlW"], additives: [], types: [],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
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
                                date: date(year: 2025, month: 1, day: 29),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 29),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 30),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Spicy Arabic chickpea soup with sweet potato, paprika and fresh mint",
                                        additions: ["2", "Se"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "served with Baguette",
                                        additions: ["GlW"]),
                                ], allergens: ["Se", "GlW"], additives: ["2"],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.4, 5.1], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Holstein turnips puree with bacon dripping",
                                        additions: [
                                            "1", "2", "3", "4", "Sf",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and cooked sausage",
                                        additions: [
                                            "1", "2", "10", "Sf",
                                        ]),
                                ], allergens: ["Sf"],
                                additives: ["1", "2", "3", "4", "10"],
                                types: ["S"], prices: [3.6, 5.4, 6.1],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Lahmacun with fresh salad",
                                        additions: ["GlW", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and tomato salsa",
                                        additions: ["Sw"]),
                                ], allergens: ["GlW", "So", "Sw"],
                                additives: [], types: [],
                                prices: [4.45, 4.45, 4.45],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
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
                                date: date(year: 2025, month: 1, day: 30),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 30),
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
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 31),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Phat Krapao - Mie noodles with spicy Thai soya mince sauce and lime leaves, opt. coriander",
                                        additions: [
                                            "1", "2", "4", "GlW", "So",
                                        ])
                                ], allergens: ["GlW", "So"],
                                additives: ["1", "2", "4"],
                                types: ["IN", "SHT", "ve", "vn"],
                                prices: [2.5, 4.45, 5.15], co2stars: 3
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Fried pan-fried fish with mustard sauce and fried potatoes",
                                        additions: [
                                            "2", "8", "Fi", "GlW", "Mi", "Sf",
                                        ])
                                ], allergens: ["Fi", "GlW", "Mi", "Sf"],
                                additives: ["2", "8"], types: [],
                                prices: [4.15, 5.95, 6.65],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Crispy börek stick with spinach filling",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and couscous",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with tomato-mint-sugo",
                                        additions: []),
                                ], allergens: ["GlW"], additives: [], types: [],
                                prices: [3.25, 3.25, 3.25],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
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
                                date: date(year: 2025, month: 1, day: 31),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Potato gratin, peas, carrots, Gouda cheese",
                                        additions: ["Ei", "Mi"])
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["ve"], prices: [3.6, 3.6, 3.6],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 31),
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
                ]
            ),
            Location.kiel(.mensaKesselhaus): (
                current: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 20),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Spaghetti with homemade pesto and marinated tomatoes",
                                        additions: [
                                            "1", "3", "5", "GlW", "NW", "Sw",
                                        ])
                                ], allergens: ["GlW", "NW", "Sw"],
                                additives: ["1", "3", "5"], types: [],
                                prices: [2.35, 4.15, 4.85],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 20),
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
                                date: date(year: 2025, month: 1, day: 20),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plantbased, golden baked nuggets",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with fruity cocktail sauce",
                                        additions: [
                                            "3", "Ei", "GlW", "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and wedges", additions: []),
                                ], allergens: ["GlW", "Ei", "Sl"],
                                additives: ["3"], types: ["STF", "ve"],
                                prices: [5.15, 5.15, 5.15],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 21),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Potato-broccoli-gratin",
                                        additions: ["Ei", "Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy cream cheese sauce",
                                        additions: ["Mi"]),
                                ], allergens: ["Ei", "Mi"], additives: [],
                                types: ["SHT", "ve"], prices: [2.5, 4.8, 5.5],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Cauliflower- cheese- patty",
                                        additions: [
                                            "Ei", "GlW", "Mi", "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with creamy mushroom sauce",
                                        additions: ["Mi"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and fried potatoes",
                                        additions: []),
                                ], allergens: ["Ei", "GlW", "Mi", "Sl"],
                                additives: [], types: ["ve"],
                                prices: [3.7, 5.5, 6.2], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 21),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Falafel plate with fresh salad,",
                                        additions: [
                                            "3", "5", "GlW", "Sw",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "and homemade plant-based tzatziki",
                                        additions: ["3", "Sf", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and french fries", additions: []
                                    ),
                                ], allergens: ["GlW", "Sw", "Sf", "So"],
                                additives: ["3", "5"],
                                types: ["STF", "ve", "vn"],
                                prices: [4.95, 4.95, 4.95],
                                co2stars: 3),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 22),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Butter chick peas - Indian chickpea curry, opt. coriander",
                                        additions: ["Sf"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["Sf"], additives: [],
                                types: ["SHT", "ve", "vn"],
                                prices: [2.5, 4.75, 5.45], co2stars: 2
                            ),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Plant-based crunchy chicken burger with tomato, iceberg lettuce, onions and salted tortilla chips",
                                        additions: [
                                            "GlW", "GlG", "GlD", "Sf", "So",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "served with colourful french fries",
                                        additions: ["GlW"]),
                                ],
                                allergens: ["GlW", "GlG", "GlD", "Sf", "So"],
                                additives: [], types: ["STF", "ve", "vn"],
                                prices: [5.95, 5.95, 5.95],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 22),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 23),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pointed cabbage, minced soy",
                                        additions: ["1", "GlG", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Tagliatelle",
                                        additions: ["GlW"]),
                                ], allergens: ["GlG", "So", "GlW"],
                                additives: ["1"], types: ["SHT", "ve", "vn"],
                                prices: [2.5, 5.2, 5.9], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Chicken Makhani - tender Indian butter chicken marinated with a spicy tomato and yog",
                                        additions: [
                                            "GlW", "Mi", "NMn", "So",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and basmati rice", additions: []
                                    ),
                                ], allergens: ["GlW", "Mi", "NMn", "So"],
                                additives: [], types: ["IN", "ve", "BIO"],
                                prices: [3.65, 5.45, 6.15],
                                co2stars: 2),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 23),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pasta bar, daily changing offer",
                                        additions: [
                                            "1", "2", "GlW", "Mi",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Pesto", additions: []),
                                ], allergens: ["GlW", "Mi"],
                                additives: ["1", "2"], types: ["ve"],
                                prices: [2.95, 4.75, 5.45], co2stars: nil),
                        ], announcements: []),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 24),
                        items: [
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Planted.™ Chicken Alfredo on pasta with cauliflower-cashew sauce",
                                        additions: [
                                            "GlW", "GlH", "NC", "Sf", "So",
                                        ])
                                ], allergens: ["GlW", "GlH", "NC", "Sf", "So"],
                                additives: [], types: ["A", "SHT", "ve", "vn"],
                                prices: [2.5, 4.7, 5.4], co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name:
                                            "Creamy red lentil dal with soya yoghurt, optional coriander",
                                        additions: ["3", "So"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "with Naan bread",
                                        additions: ["GlW", "So"]),
                                ], allergens: ["So", "GlW"], additives: ["3"],
                                types: [], prices: [3.55, 5.35, 6.05],
                                co2stars: 3),
                            MenuOfTheDay.Item(
                                date: date(year: 2025, month: 1, day: 24),
                                name: [
                                    MenuOfTheDay.Item.NamePart(
                                        name: "Fish from the field in batter",
                                        additions: ["GlW"]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "homemade remoulade sauce",
                                        additions: [
                                            "3", "8", "Ei", "GlW", "Mi", "Sf",
                                            "Sl",
                                        ]),
                                    MenuOfTheDay.Item.NamePart(
                                        name: "and French fries", additions: []
                                    ),
                                ], allergens: ["GlW", "Ei", "Mi", "Sf", "Sl"],
                                additives: ["3", "8"], types: ["STF"],
                                prices: [4.75, 4.75, 4.75],
                                co2stars: 3),
                        ], announcements: []),
                ],
                next: [
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 27), items: [],
                        announcements: [
                            "No information is available for the selected day."
                        ]),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 28), items: [],
                        announcements: [
                            "No information is available for the selected day."
                        ]),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 29), items: [],
                        announcements: [
                            "No information is available for the selected day."
                        ]),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 30), items: [],
                        announcements: [
                            "No information is available for the selected day."
                        ]),
                    MenuOfTheDay(
                        date: date(year: 2025, month: 1, day: 31), items: [],
                        announcements: [
                            "No information is available for the selected day."
                        ]),
                ]
            ),
        ]
}
