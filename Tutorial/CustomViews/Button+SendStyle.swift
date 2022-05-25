//
//  File.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 13/05/2022.
//

import Foundation
import SwiftUI

struct SendButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "paperplane")
                .symbolVariant(.fill)
            Divider()
                .padding(.vertical, 8)
            configuration.label
        }
        .frame(maxWidth: 200, minHeight: 55)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension ButtonStyle where Self == SendButtonStyle {
    static var sendEmail: SendButtonStyle { .init() }
}
