//
//  ContentView.swift
//  Searchable
//
//  Created by Tunde on 08/06/2021.
//

import SwiftUI

struct RootListFood: View {
    
    @Environment(\.isSearching) var isSearching
    @ObservedObject var vm: MenuViewModel
    @Binding var query: String
    
    var body: some View {
            List {
                ForEach(vm.filteredData){ item in
                    FoodItemView(item: item)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
            .onAppear {
                vm.search()
            }
            .onChange(of: query) { newQuery in
                vm.search(with: newQuery)
            }
            .overlay {
                if isSearching && vm.filteredData.isEmpty {
                    PromosView(vm: vm,
                               query: $query)
                }
            }

    }
}

struct RootListFood_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootListFood(vm: MenuViewModel() ,query: .constant("Burger"))
        }
    }
}


