//
//  ButtonScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 12/05/2022.
//

import SwiftUI

struct ButtonScreen: View {
    @State private var counter: Int = 0
    var body: some View {
        ScrollView {
            VStack() {
                
                Button(role: .cancel) {
                    //counter += 1
                } label: {
                    Text("Add 1, couter is at \(counter)")
                }
                .buttonStyle(.sendEmail)
                
                Button(action: increaseCounter) {
                    Text("Add 1, couter is at \(counter)")
                }
                SendButton{
                    increaseCounter()
                }
                
                VStack(spacing: 20) {
                    Button(role: .destructive) {
                        
                    } label: {Text("Subscribe")}
                    .tint(.red)
                    .buttonStyle(.borderedProminent)
                    //.buttonBorderShape(.roundedRectangle(radius: 10))
                    //.buttonBorderShape(.capsule)
                    .buttonBorderShape(.automatic)
                    .controlSize(.large)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Text("Sub Twitch")
                        }
                        .padding()
                        .background(.thinMaterial, in: Capsule())
                    }
                    .frame(maxWidth: .infinity, minHeight: 70)
                    .background(.mint)

                }

            }
        }
    }
}

struct ButtonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ButtonScreen()
    }
}

private extension ButtonScreen {
    func increaseCounter() {
        counter += 1
    }
}
