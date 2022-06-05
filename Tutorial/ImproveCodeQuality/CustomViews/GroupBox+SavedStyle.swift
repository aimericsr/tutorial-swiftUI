//
//  GroupBox+SavedStyle.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import Foundation
import SwiftUI

struct GroupBoxSavedStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            configuration.label
            configuration.content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 8))
    }
}

extension GroupBoxStyle where Self == GroupBoxSavedStyle {
    static var saved: GroupBoxSavedStyle { .init() }
}
