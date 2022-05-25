//
//  LayoutScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 01/05/2022.
//

import SwiftUI

struct LayoutScreen: View {
    var body: some View {
        VStack{
            Image("Pexels")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 200)
                .clipShape(Circle())
                .overlay(alignment: .bottom) {
                    Text("New Video")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .bold()
                        .font(.callout)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(.red)
                        .clipShape(Capsule())
                        .offset(x: 25, y: 19)
                }
        }
//        VStack{
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//            Text("Hello World")
//                .background(.blue)
//        }
//        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
//        .background(.mint)
//        .clipped()
    }
}

struct LayoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        LayoutScreen()
    }
}
