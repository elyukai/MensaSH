//
//  Array.swift
//  MensaSH
//
//  Created by Lukas Obermann on 07.02.25.
//

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise `nil`.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
