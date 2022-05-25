//
//  AnimationScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 15/05/2022.
//

import SwiftUI

struct AnimationScreen: View {
    @State private var isGreen: Bool = false
    @State private var isMinimized: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(isGreen ? .green : .red)
                .scaleEffect(isMinimized ? 0.5 : 1)
                .animation(.easeInOut, value: isGreen)
                .animation(.spring().delay(0.01).speed(0.50), value: isMinimized)
                .frame(maxHeight: 200)
            Button {
                //withAnimation(.easeInOut) {
                    isGreen.toggle()
                //}
            } label: {
                Text(isGreen ? "Turn red" : "Turn green")
            }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            .controlSize(.large)
            
            Button {
                //withAnimation(.spring()) {
                    isMinimized.toggle()
                //}
            } label: {
                Text(isMinimized ? "Maximized" : "Minimized")
            }
            .buttonStyle(.borderedProminent)
            .tint(.mint)
            .controlSize(.large)
        }
        .padding()
    }
}

struct AnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScreen()
    }
}
