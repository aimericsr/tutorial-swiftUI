//
//  SpacerScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 12/05/2022.
//

import SwiftUI

struct SpacerScreen: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Name")
                Text("FirstName")
            }
            //.frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Name")
                    .bold()
                    .background(.blue)
                Spacer(minLength: 20)
                    .background(.black)
                //spacer can't have background
                Text("FirstName")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.red)
            }
            .background(.orange)
        }
    }
}

struct SpacerScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpacerScreen()
    }
}
