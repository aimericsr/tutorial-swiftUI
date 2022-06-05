//
//  LogoComponant.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 05/06/2022.
//

import SwiftUI

struct LogoComponant: View {
    var body: some View {
        Asset.logo
            .resizable()
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray)
            )
    }
}

struct LogoComponant_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogoComponant()
                .preview(name: "Logo Light Mode", layout: .sizeThatFits, colorScheme: .light)
            LogoComponant()
                .preview(name: "Logo Dark Mode", layout: .sizeThatFits, colorScheme: .dark)
        }
    }
}
