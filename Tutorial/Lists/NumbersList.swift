//
//  NumbersList.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct NumbersList: View {
    var body: some View {
        NavigationView {
            List(0..<20) { i in
                Text("Number \(i)")
            }
            .navigationTitle("Numbers")
            .safeAreaInset(edge: .bottom,
                           alignment: .trailing,
                           spacing: 50) {
                plusBtn
                    .padding([.trailing, .bottom])
            }
            .safeAreaInset(edge: .leading,
                    alignment: .bottom) {
                sideBar
                    .padding([.trailing, .bottom])
            }
        }
    }
}

struct NumbersList_Previews: PreviewProvider {
    static var previews: some View {
        NumbersList()
    }
}

private extension NumbersList {
    var plusBtn: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .symbolVariant(.circle.fill)
                .font(.system(size: 44, weight: .bold, design: .rounded))
        }
        
    }
    
    var sideBar: some View {
        VStack(alignment: .leading) {
            ForEach(["Home", "Features", "My Profiles", "Settings"],
                    id: \.self) { item in
                Text("\(item)")
                    .bold()
                    .padding()
            }
        }
    }
}
