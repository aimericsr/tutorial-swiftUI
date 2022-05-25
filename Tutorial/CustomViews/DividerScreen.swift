//
//  DividerScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 10/05/2022.
//

import SwiftUI

struct DividerScreen: View {
    @State private var color: Color = .red
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            ScrollView {
                VStack {
                    //Group {
                    Text("the color choosen")
                    HStack {
                        Text("Some content for recipe")
                        Divider()
                            .frame(height: 50)
                            .background(.blue)
                        Image(systemName: "lock")
                    }
                    .padding()
                    .border(.black)
                    .background(color)
                    ColorPicker(selection: $color, supportsOpacity: false) {
                        Label("Color Pallete", systemImage: "paintpalette")
                    }
                    //.labelsHidden()
                    .padding()
                }
                
                VStack {
                    Rectangle()
                        .frame(height: 5)
                    Text("Open link to safari / label")
                        .font(.title2)
                    //                Link("Open tundsdev",
                    //                    destination: .init(string: "https://www.apple.com/fr/iphone-13-pro/")!)
                    VStack (spacing: 20){
                        Label("Pick a color", systemImage: "paintpalette")
                        Label("Pexels", image: "Pexels")
                        Link(destination: .init(string: "https://www.apple.com/fr/iphone-13-pro/")!) {
                            Label {
                                Text("Go to channel")
                                    .padding()
                                    .background(.red)
                                    .clipShape(Capsule())
                            } icon: {
                                Image("Pexels")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .clipShape(Circle())
                            }
                        }
                        Label("Pexels", image: "Pexels")
                            .labelStyle(CapsuleStyle())
                        Label("Pexels", image: "Pexels")
                            .labelStyle(StrongCapsuleStyle(color: .mint))
                        
                        Label("Pexels", image: "Pexels")
                            .labelStyle(.capsule)
                        Label("Pexels", image: "Pexels")
                            .labelStyle(.strongCapsule(color: .purple))
                        Label("Pexels", image: "Pexels")
                            .labelStyle(.strongCapsule(color: .purple))
                            .labelStyle(.titleOnly)
                    }
                }
            }
        }
        .foregroundColor(.black)
        .padding()
    }
}

struct DividerScreen_Previews: PreviewProvider {
    static var previews: some View {
        DividerScreen()
        
    }
}
