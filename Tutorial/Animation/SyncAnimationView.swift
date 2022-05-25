//
//  SyncAnimationView.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 18/05/2022.
//

// website : https://cubic-bezier.com

import SwiftUI

struct AnimationConfig: Identifiable {
    let id = UUID()
    let animation: Animation
    let description: String
}

extension AnimationConfig {
    static let options: [AnimationConfig] = [
        .init(animation: .easeInOut(duration: 1.5).delay(0.5), description: "Ease In Out"),
        .init(animation: .easeIn(duration: 1.5), description: "Ease In"),
        .init(animation: .easeOut(duration: 1.5), description: "Ease Out"),
        .init(animation: .linear(duration: 1.5), description: "Linear"),
        .init(animation: .timingCurve(0.49, 0.06, 0, 0.53, duration: 1), description: "Custom Bezier Curve")
    ]
}

struct SyncAnimationView: View {
    var body: some View {
        ScrollView {
            LazyVGrid (
                columns: Array(repeating: GridItem(.flexible()), count: 3),
                spacing: 16){
                    ForEach(AnimationConfig.options) { config in
                        SyncLogo(config: config)
                    }
                }
        }
    }
}

struct SyncAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SyncAnimationView()
    }
}
