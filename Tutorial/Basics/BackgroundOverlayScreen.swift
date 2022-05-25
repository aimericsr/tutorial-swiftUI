//
//  BackgroundOverlayScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct BackgroundOverlayScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("5")
                    .padding()
                    .background {
                        Circle()
                            .fill(.yellow.opacity(0.3))
                        Image(systemName: "star")
                            .symbolVariant(.fill)
                            .foregroundColor(.yellow)
                            .font(.system(size: 32))
                            .offset(y: -2)
                    }
                
                Text("5")
                    .padding()
                    .background(alignment: .bottom) {
                        Image(systemName: "star")
                            .symbolVariant(.fill)
                            .foregroundColor(.yellow)
                            .font(.system(size: 32))
                            .offset(y: -2)
                    }
                
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background {
                        Circle()
                            .fill(.blue)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Text("Techno")
                            .foregroundColor(.white)
                            .font(.body.bold())
                            .padding(4)
                            .background {
                                Capsule().fill(.red)
                            }
                    }
                
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background {
                        Circle()
                            .fill(.blue)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Text("Techno")
                            .foregroundColor(.white)
                            .font(.body.bold())
                            .padding(4)
                            .background(.ultraThinMaterial, in: Capsule() )
                    }
                
            }
        }
    }
}

struct BackgroundOverlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayScreen()
    }
}
