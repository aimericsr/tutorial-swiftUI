//
//  TemplateTransa.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 18/05/2022.
//

import SwiftUI

struct TemplateTransition: View {
    @State private var isVisible: Bool = false
    
    let title: String
    let transition: AnyTransition
    
    var body: some View {
        VStack {
            if isVisible {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .transition(transition)
            }
            
            Button(title){
                withAnimation {
                    isVisible.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: 240)
        .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct TemplateTransition_Previews: PreviewProvider {
    static var previews: some View {
        TemplateTransition(title: "Template", transition: .opacity)
    }
}
