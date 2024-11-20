//
//  AnnouncementRow.swift
//  MensaSH
//
//  Created by Lukas Obermann on 20.11.24.
//

import SwiftUI

struct AnnouncementRow: View {
    var text: String
    
    var body: some View {
        Label {
            Text(text)
                .foregroundStyle(.secondary)
        } icon: {
            Image(systemName: "exclamationmark.triangle")
        }
        .listItemTint(.orange)
    }
}

#Preview {
    List {
        AnnouncementRow(text: "Für den gewählten Tag sind keine Informationen verfügbar.")
    }
}
