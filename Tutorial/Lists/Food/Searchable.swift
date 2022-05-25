//
//  SearchableApp.swift
//  Searchable
//
//  Created by Tunde on 08/06/2021.
//

import SwiftUI

struct Searchable: View {
    
    @State private var query = ""
    @StateObject private var vm = MenuViewModel()
    
    var body: some View {
        
            NavigationView {
                RootListFood(vm: vm, query: $query)
                    .searchable(text: $query)
            }
        }
}

struct Searchable_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Searchable()
        }
    }
}
