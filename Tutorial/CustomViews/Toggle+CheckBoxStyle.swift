//
//  Toggle+CheckBoxStyle.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 12/05/2022.
//

import Foundation
import SwiftUI

struct ToggleCheckBoxStyle: ToggleStyle {
    
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
        .tint(color)
    }
}

extension ToggleStyle where Self == ToggleCheckBoxStyle {
    static func check(color: Color = .red) -> ToggleCheckBoxStyle { .init(color: color) }
}
