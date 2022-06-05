//
//  Label+CapsuleStyle.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 10/05/2022.
//

import Foundation
import SwiftUI

struct CapsuleStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

extension LabelStyle where Self == CapsuleStyle {
    static var capsule: CapsuleStyle { .init() }
}

struct StrongCapsuleStyle: LabelStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration
                .title
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
        } icon: {
            configuration.icon
        }
        .padding()
        .background(color)
        .clipShape(Capsule())
    }
}

extension LabelStyle where Self == CapsuleStyle {
    static func strongCapsule(color: Color = .red) -> StrongCapsuleStyle { .init(color: color) }
}
