//
//  CapsuleButtonViewModifier.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 19/05/2022.
//

import SwiftUI

struct CapsuleButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 50)
    }
}

extension View {
    func applyCapsuleButtonStyle() -> some View {
        self.modifier(CapsuleButtonViewModifier())
    }
}
