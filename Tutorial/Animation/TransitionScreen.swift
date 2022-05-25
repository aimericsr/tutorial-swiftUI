//
//  TransitionScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 18/05/2022.
//

import SwiftUI

struct TransitionScreen: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                Group {
                    TemplateTransition(title: "Toggle Opacity", transition: .opacity)
                    TemplateTransition(title: "Toggle Move Top", transition: .move(edge: .top))
                    TemplateTransition(title: "Toggle Slide", transition: .slide)
                    TemplateTransition(title: "Toggle Scale", transition: .scale)
                    TemplateTransition(title: "Toggle Scale from 50%", transition: .scale(scale: 0.5))
                    TemplateTransition(title: "Toggle Scale from 50% top left", transition: .scale(scale: 0.5, anchor: .topLeading))
                }
                
                Group {
                    let combinationTransiction = AnyTransition
                        .slide
                        .combined(with: .scale(scale: 0.5))
                        .combined(with: .opacity)
                    TemplateTransition(title: "Toggle Combined", transition: combinationTransiction)
                    
                    let asymetricTransiction = AnyTransition
                        .asymmetric(insertion: .move(edge: .bottom), removal: .slide)
                    TemplateTransition(title: "Toggle Asymetric", transition: asymetricTransiction)
                    
                    let firstCombinationTransiction = AnyTransition
                        .move(edge: .bottom)
                        .combined(with: .opacity)
                    
                    let secondCombinationTransiction = AnyTransition
                        .move(edge: .bottom)
                        .combined(with: .scale)
                    
                    TemplateTransition(title: "Toggle Combined Asymetric", transition: .asymmetric(insertion: firstCombinationTransiction, removal: secondCombinationTransiction))
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TransitionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransitionScreen()
    }
}
