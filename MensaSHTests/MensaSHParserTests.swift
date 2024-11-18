//
//  MensaSHParserTests.swift
//  MensaSHTests
//
//  Created by Lukas Obermann on 17.11.24.
//

import Testing

struct MensaSHParserTests {

    @Test func testHTML() async throws {
        let parser = MensaParser()
        let html = try await parser.readWeeklyMenu()
        print(html)
        #expect(html.count == Location.allCases.count)
    }

}
