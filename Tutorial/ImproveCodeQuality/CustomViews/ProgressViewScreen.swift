//
//  ProgressViewScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 10/05/2022.
//

import SwiftUI

struct ProgressViewScreen: View {
    @State private var progressSecondExample: Double = 0
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                ProgressView {
                    Text("Loading your content")
                }
                .progressViewStyle(.rounded)
            }
            VStack {
                ProgressView(value: progressSecondExample, total: 5){
                    Label("recipe for \(progressSecondExample, specifier: "%.0f") person", systemImage: "lock")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button {
                    withAnimation {
                        progressSecondExample += 1
                    }
                } label: {
                    Text("Increase")
                }
            }
            VStack {
                
                Toggle(isOn: $isSelected) {
                    Image(systemName: "lightbulb")
                        .symbolVariant(isSelected ? .fill : .none)
                }
                .toggleStyle(.button)
                
                Toggle("", isOn: $isSelected)
                    .font(.largeTitle)
                    .toggleStyle(.check(color: .purple))
            }
        }
    }
}

struct ProgressViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewScreen()
    }
}
