//
//  Previews+ViewModifier.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 05/06/2022.
//

import Foundation
import SwiftUI

struct PreviewsViewModifier: ViewModifier {
    let colorScheme: ColorScheme?
    let previewLayout: PreviewLayout
    let previewDiplayName: String
    
    func body(content: Content) -> some View {
        content
        .preferredColorScheme(colorScheme)
        .padding(8.0)
        .previewLayout(previewLayout)
        .previewDisplayName(previewDiplayName)
    }
}

extension View {
    func preview(name: String, layout: PreviewLayout = .sizeThatFits, colorScheme: ColorScheme? = nil) -> some View {
        self.modifier(PreviewsViewModifier(colorScheme: colorScheme, previewLayout: layout, previewDiplayName: name))
    }
}
