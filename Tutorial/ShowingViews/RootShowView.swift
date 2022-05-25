//
//  ContentView.swift
//  PresentingAnDismissingViewsInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import SwiftUI

struct RootShowView: View {
    
    // Simple Sheet
    @State private var isShowingSimpleSheet: Bool = false
    
    // Simple Full screen cover
    @State private var isShowingSimpleFullScreenCover: Bool = false
    
    // Popover
    @State private var isShowingSimplePopover: Bool = false

    // Terms
    @State private var isShowingTerms: Bool = false
    @State private var hasAcceptedTerms: Bool = false
    
    var body: some View {
        
        VStack {
            sheetSimpleExample
            fullscreenSimpleExample
            popoverSimpleExample
            termsExample
        }
        .sheet(isPresented: $isShowingTerms) {
            TermsView(isShowingTerms: $isShowingTerms,
                               hasAcceptedTerms: $hasAcceptedTerms)
                .interactiveDismissDisabled(!hasAcceptedTerms)
        }
        .sheet(isPresented: $isShowingSimpleSheet,
               onDismiss: didDismiss) {
            Warning()
                .ignoresSafeArea()
        }
       .fullScreenCover(isPresented: $isShowingSimpleFullScreenCover,
                        onDismiss: didDismiss) {
           Warning()
               .ignoresSafeArea()
       }
       .popover(isPresented: $isShowingSimplePopover,
                attachmentAnchor: .point(.trailing),
                arrowEdge: .trailing) {
           Warning()
       }
    }
}

struct RootShowView_Previews: PreviewProvider {
    static var previews: some View {
        RootShowView()
    }
}

private extension RootShowView {
    
    func didDismiss() {
        print("Dismissed sheet")
    }
}

private extension RootShowView {
    
    var termsExample: some View {
        
        Button("Terms Example") {
            isShowingTerms.toggle()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
    }
    
    var sheetSimpleExample: some View {
        
        Button("Sheet Example") {
            isShowingSimpleSheet.toggle()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
    }
    
    var fullscreenSimpleExample: some View {
        
        Button("Fullscreen Example") {
            isShowingSimpleFullScreenCover.toggle()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
    }
    
    var popoverSimpleExample: some View {
        
        Button("Popover Example") {
            isShowingSimplePopover.toggle()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}
