//
//  LazyGridScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 15/05/2022.
//

import SwiftUI

struct LazyGridScreen: View {
    private let items = (1...50).map{"Item \($0)"}
    private let columns: [GridItem] = [
//        GridItem(.flexible(minimum: 20, maximum: 50)),
//        GridItem(.flexible())
        
        GridItem(.fixed(100)),
        GridItem(.fixed(50)),
        GridItem(.fixed(100))
        
//        GridItem(.adaptive(minimum: 50, maximum: 100)),
//        GridItem(.adaptive(minimum: 100, maximum: 150))
    ]
    
    @State private var isMultiColumn: Bool = false
    private var columns2: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: isMultiColumn ? 2 : 1)
    }
    
    var body: some View {
        //VGridExemple
        //HGridExemple
        ScrollView {
            Button {
                isMultiColumn.toggle()
            } label: {
                Image(systemName: isMultiColumn ? "rectangle.grid.1x2" : "square.grid.2x2")
                    .symbolVariant(.fill)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
            LazyVGrid(columns: columns2, alignment: .trailing, spacing: 16) {
                ForEach(0...50, id:\.self) { item in
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.mint)
                        .frame(height: isMultiColumn ? 100 : 250)
                }
            }
            .animation(.spring(), value: isMultiColumn)
            .padding(.horizontal, 16)
            
        }
    }
}

struct LazyGridScreen_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridScreen()
    }
}

private extension LazyGridScreen {
    var VGridExemple: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 30,
                pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(items, id:\.self) { item in
                            Text(item)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 50)
                                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    } header: {
                        Text("First Section")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.mint)
                    }

                    Section {
                        ForEach(items, id:\.self) { item in
                            Text(item)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 50)
                                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    } header: {
                        Text("Second Section")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.pink)
                    }
                
            }
        }
    }
    
    var HGridExemple: some View {
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: columns,
                alignment: .top,
                spacing: 30,
                pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(items, id:\.self) { item in
                            Text(item)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 50)
                                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    } header: {
                        Text("First Section")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.mint)
                    }

                    Section {
                        ForEach(items, id:\.self) { item in
                            Text(item)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 50)
                                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    } header: {
                        Text("Second Section")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.pink)
                    }
                
            }
        }
    }
}
