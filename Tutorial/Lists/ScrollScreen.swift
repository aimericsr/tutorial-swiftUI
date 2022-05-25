//
//  ScrolScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 15/05/2022.
//

import SwiftUI

struct ScrollScreen: View {
    private let range: ClosedRange<Int> = 0...50
    
    @State private var hasReachedEnd: Bool = false
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal ,showsIndicators: false) {
                    HStack {
                        ForEach(range, id:\.self){ index in
                            createTxtVw(with: index)
                        }
                    }
                    .padding(.bottom, 50)
                    .overlay(alignment: hasReachedEnd ? .bottomTrailing : .bottomLeading) {
                        HStack {
                            Button {
                                if let firstIndex = range.min() {
                                    withAnimation {
                                        proxy.scrollTo(firstIndex)
                                    }
                                    hasReachedEnd = false
                                }
                            } label: {
                                Image(systemName: "arrow.backward")
                            }
                            Button {
                                if let lastIndex = range.max() {
                                    withAnimation {
                                        proxy.scrollTo(lastIndex)
                                    }
                                    hasReachedEnd = true
                                }
                            } label: {
                                Image(systemName: "arrow.forward")
                            }
                        }
                        .symbolVariant(.circle.fill)
                        .font(.title.weight(.black))
                    }
                }
            }
        }
    }
}

struct ScrollScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScrollScreen()
    }
}

private extension ScrollScreen {
    func createTxtVw(with index: Int) -> some View {
        Text("\(index)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(.mint)
            .padding(.horizontal, 8)
    }
}
