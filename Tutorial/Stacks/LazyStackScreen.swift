//
//  LazyStackScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 15/05/2022.
//

import SwiftUI

struct LazyStackScreen: View {
    var body: some View {
//        ScrollView {
//            LazyVStack(
//                alignment: .leading,
//                spacing: 32,
//                pinnedViews: .sectionHeaders) {
//                Section {
//                    ForEach(0...50, id:\.self){ i in
//                        Text("\(i)")
//                    }
//                } header: {
//                    Text("First Section")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(.mint)
//                } footer: {
//                    Text("End of First Section")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(.mint)
//                }
//
//                Section {
//                    ForEach(51...100, id:\.self){ i in
//                        Text("\(i)")
//                    }
//                } header: {
//                    Text("Second Section")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(.pink)
//                }
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHStack(
                alignment: .bottom,
                spacing: 32,
                pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(0...50, id:\.self){ i in
                        Text("\(i)")
                    }
                } header: {
                    Text("First Section")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.mint)
                } footer: {
                    Text("End of First Section")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.mint)
                }
                
                Section {
                    ForEach(51...100, id:\.self){ i in
                        Text("\(i)")
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

struct LazyStackScreen_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackScreen()
    }
}
