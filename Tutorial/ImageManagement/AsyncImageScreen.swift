//
//  AsyncImage.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct AsyncImageScreen: View {
    private let urlImage: String = "https://access.imgdownloader.com/original_20220514232036755161/imgdownloader.com-20220514232037027852.jpg"
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlImage),
                       // .init(animation: .spring().delay(Double(index)* 0.5))
                       transaction: .init(animation: .easeInOut)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Color.gray
                case .empty:
                    Color.blue
                        .overlay {
                            ProgressView()
                        }
                @unknown default:
                    EmptyView()
                }
        }
            
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .transition(.opacity.combined(with: .scale))
            
    }
}

}

struct AsyncImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageScreen()
    }
}


