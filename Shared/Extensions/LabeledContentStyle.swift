//
//  LabeledContentStyle.swift
//  MensaSH
//
//  Created by Lukas Obermann on 15.01.26.
//

import SwiftUI

struct VerticalLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
                .foregroundStyle(.secondary)
        }
    }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
    static var vertical: VerticalLabeledContentStyle { .init() }
}
