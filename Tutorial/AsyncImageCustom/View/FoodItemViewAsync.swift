//
//  FoodItemView.swift
//  FoodItemView
//
//  Created by Tunde on 29/07/2021.
//

import SwiftUI

struct FoodItemViewAsync: View {
    
    let item: FoodItemAsync
    
    private let cornerRadius: CGFloat = 12
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            VStack {
                CachedImage(item: (name: item.title, url: item.imgUrl),
                            animation: .spring(),
                            transition: .slide.combined(with: .opacity)) { phase in
                    
                    switch phase {
                    case .empty:
                        
                        ProgressView()
                            .frame(width: 100, height: 100)
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8,
                                                                    style: .continuous))
                        
                    case .success(let image):
                        
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8,
                                                                    style: .continuous))
                    case .failure:
                        
                        Image(systemName: "xmark")
                                            .symbolVariant(.circle.fill)
                                            .foregroundStyle(.white)
                                            .frame(width: 100, height: 100)
                                            .background(.blue, in: RoundedRectangle(cornerRadius: 8,
                                                                                    style: .continuous))
                    @unknown default:
                        EmptyView()
                    }
                    
                }

            }
            
            VStack(alignment: .leading,
                   spacing: 8) {
                
                Text(item.title)
                    .font(.headline)
                Text(item.attributedPrice)
                Text(item.desc)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
                   .foregroundColor(.black)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

struct FoodItemViewAsync_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemViewAsync(item: FoodItemAsync.preview)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black.opacity(0.7))
    }
}
