//
//  ContentView.swift
//  TestApp
//
//  Created by Aimeric Sorin on 27/03/2022.
//

import SwiftUI

struct ImageScreen: View {
    var body: some View {
        VStack{
            VStack{
                Image(systemName:"cloud.sun.fill")
                    .symbolRenderingMode(.multicolor)
                    .padding()
                Image(systemName:"cloud.sun.fill")
                    .symbolRenderingMode(.monochrome)
                Image(systemName:"cloud.sun.fill")
                    .symbolRenderingMode(.hierarchical)
                Image(systemName:"cloud.sun.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.red, .green)
                Label("Sun", systemImage: "cloud.sun")
                    .imageScale(.large)
                    .padding()
                Label("Sun", systemImage: "cloud.sun")
                    .symbolVariant(.fill)
                    .padding()
            }
            .font(.system(size: 20, weight: .bold))
            .background(.blue)
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
            Image("techno")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
        }
    }
}

struct ImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImageScreen()
    }
}
