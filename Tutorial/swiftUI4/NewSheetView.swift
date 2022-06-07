//
//  NewSheetView.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 07/06/2022.
//

import SwiftUI

struct NewSheetView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("Show sheet") {
                isShowingSheet.toggle()
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            Text("Sheet content")
                .presentationDetents([.small, .medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

extension PresentationDetent {
    static let small = Self.height(100)
}

struct NewSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewSheetView()
    }
}
