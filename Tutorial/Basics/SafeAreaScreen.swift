//
//  SafeAreaScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct SafeAreaScreen: View {
    private var grandientsColors: [Color] {
        [.blue, .red]
    }
    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                ScrollView {
                    Text("Content")
                        .bold()
                        .font(.largeTitle)
                    .foregroundColor(.white)
                    
                    TextField("Some textfield", text: .constant(""))
                    
                    ForEach(0...15, id: \.self){ item in
                        Text("\(item)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
                .foregroundColor(.white)
                .textFieldStyle(.roundedBorder)
                .padding()
                
            }
            .navigationTitle("Home")
            //.ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct SafeAreaScreen_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaScreen()
    }
}

private extension SafeAreaScreen {
    var backgroundView: some View {
        LinearGradient(colors: grandientsColors, startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            //.ignoresSafeArea(.container, edges: [.bottom])
    }
}
