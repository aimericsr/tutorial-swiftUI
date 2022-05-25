//
//  ProgressView+RoudedStyle.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 10/05/2022.
//

import Foundation
import SwiftUI

struct RoundedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .tint(.white)
            .foregroundColor(.white)
    }
}

extension ProgressViewStyle where Self == RoundedProgressViewStyle {
    static var rounded: RoundedProgressViewStyle { .init() }
}
