//
//  Array+RawRepresentable.swift
//  MensaSH
//
//  Created by Lukas Obermann on 18.11.24.
//

import Foundation

extension Set: @retroactive RawRepresentable where Element: Codable {
    nonisolated public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode(Set<Element>.self, from: data)
        else { return nil }
        self = result
    }

    nonisolated public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
