//
//  ButtonExemple.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 19/05/2022.
//

import SwiftUI

struct ButtonExemple: View {
    var body: some View {
        VStack {
            Button {
                print("Tapped")
            } label: {
                Text("Custom modifier applied")
            }
            .applyCapsuleButtonStyle()

        }
    }
}

struct ButtonExemple_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExemple()
    }
}
