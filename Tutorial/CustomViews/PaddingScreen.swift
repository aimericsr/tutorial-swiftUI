//
//  PaddingScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 10/05/2022.
//

import SwiftUI

struct PaddingScreen: View {
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
                .border(.red, width: 2)
            Text("Hello World!")
                .padding(4)
                .border(.red, width: 2)
            Text("Hello World!")
                .padding(.leading, 15)
                .border(.red, width: 2)
            HStack {
                Text("Hello World!")
                    .padding(.horizontal, 15)
                    .border(.red, width: 2)
                Text("Pushed view")
            }
        }
    }
}

struct PaddingScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaddingScreen()
    }
}
