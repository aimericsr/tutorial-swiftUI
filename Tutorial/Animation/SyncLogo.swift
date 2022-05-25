//
//  SyncLogo.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 18/05/2022.
//

import SwiftUI

struct SyncLogo: View {
    @State private var isSyncing: Bool = false
    let config: AnimationConfig
    
    private var rotationAnimation: Animation {
        config
        .animation
        .repeatForever(autoreverses: false)
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .symbolVariant(.circle.fill)
                .foregroundColor(.blue)
                .font(.largeTitle)
                .rotationEffect(.init(degrees: isSyncing ? 360 : 0))
                .animation(rotationAnimation, value: isSyncing)
                .padding()
                .onAppear{
                    isSyncing.toggle()
            }
            
            Text(config.description)
        }
    }
}

struct SyncLogo_Previews: PreviewProvider {
    static var previews: some View {
        SyncLogo(config: AnimationConfig.options.first!)
    }
}
