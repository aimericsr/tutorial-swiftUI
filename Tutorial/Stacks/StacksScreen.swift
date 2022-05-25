//
//  StacksScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 15/05/2022.
//

import SwiftUI

struct StacksScreen: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .symbolVariant(.fill)
                    .foregroundColor(.yellow)
                Text("Hello, World!")
                    .zIndex(1)
            }
            VStack(alignment: .leading ,spacing: 30) {
                Group {
                    Text("df")
                    ForEach(1...5, id:\.self){ index in
                        Text("\(index)")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding([.leading, .trailing])
            }
            .padding(.top, 30)
            HStack(alignment: .top) {
                ForEach(1...10, id:\.self){ index in
                    Text("Item \(index)")
                        .fixedSize()
                }
            }
        }
    }
}

struct StacksScreen_Previews: PreviewProvider {
    static var previews: some View {
        StacksScreen()
    }
}
