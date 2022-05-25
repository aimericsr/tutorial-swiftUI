//
//  ColorsScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 01/05/2022.
//

import SwiftUI

struct ColorsScreen: View {
    var body: some View {
        ZStack {
            //LinearGradient(gradient: Gradient(colors: [.mint, Color("Secondary"), .black]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            LinearGradient(stops: (
                [.init(color: .mint, location: 0.2),
                .init(color: .black, location: 0.5)]),
                startPoint: .top,
                endPoint: .bottom)
            
//            RadialGradient(colors: [.black, .mint, .purple, .blue], center: .center, startRadius: 50, endRadius: 100)
//                    .ignoresSafeArea()
            
            VStack{
                Text("Tutorial")
                    .foregroundColor(.accentColor)
                    .padding()
                    .background(Color(uiColor: .init(.mint)))
                AngularGradient(colors: [.blue, .red, .yellow],
                                center: .center,
                                angle: .degrees(180))
                .mask(
                        Text("Secondary color")
                )
            }
        }
    }
}


struct ColorsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ColorsScreen()
            
    }
}
