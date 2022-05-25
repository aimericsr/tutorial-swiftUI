//
//  ContentView.swift
//  Sandbox
//
//  Created by Aimeric Sorin on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
        .onAppear {
            
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 5) {
                    launchScreenManager.dismiss()
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}
