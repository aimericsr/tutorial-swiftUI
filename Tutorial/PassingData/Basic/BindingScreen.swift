//
//  BindingScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 01/05/2022.
//

import SwiftUI

struct BindingScreen: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
                CustomLoadingView(isLoading: $isOn)
            
            Image(systemName: "lightbulb")
                .font(.largeTitle)
                .symbolVariant(isOn ? .fill : .none)
                .foregroundColor(isOn ? .yellow : .black)
            Toggle(isOn: $isOn) {
                Text("Toggle switch")
            }
            .labelsHidden()
        }
    }
}

struct CustomLoadingView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
        }else {
            Text("Finished Loading")
        }
    }
}


struct BindingScreen_Previews: PreviewProvider {
    static var previews: some View {
        BindingScreen()
            .preferredColorScheme(.dark)
    }
}
