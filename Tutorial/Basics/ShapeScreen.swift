//
//  ShapeScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 01/05/2022.
//

import SwiftUI

struct ShapeScreen: View {
    var body: some View {
        VStack{
            Capsule(style: .circular)
                .fill(.blue)
                .frame(width: 100, height: 50)
            Capsule(style: .continuous)
                .frame(width: 100, height: 50)
            Circle()
                .frame(width: 100, height: 50)
            Ellipse()
                .frame(width: 100, height: 50)
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 50)
            Image("Pexels")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
//            Text("Border Test")
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.blue, lineWidth: 5)
//                )
            ZStack {
                Circle()
                    .strokeBorder(
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .red]), center: .center, endAngle: .degrees(360)),
                        lineWidth: 50
                    )
                .padding()
                Text("69%")
            }
        }
    }
}

struct ShapeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShapeScreen()
    }
}
    
