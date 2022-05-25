//
//  ContentView.swift
//  AsyncImageStarter
//
//  Created by Tunde on 21/08/2021.
//

import SwiftUI

struct AsyncImageCustom: View {
    
    @StateObject private var vm: MenuViewModelAsync = MenuViewModelAsync()
    
    var body: some View {
        List {
            ForEach(vm.data) { item in
                FoodItemViewAsync(item: item)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Menu")
    }
}

struct AsyncImageCustom_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AsyncImageCustom()
               // .environmentObject(MenuViewModelAsync())
        }
    }
}
