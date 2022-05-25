//
//  EmptyView.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 20/05/2022.
//

import SwiftUI

struct EmptyViewSearch: View {
    @Environment(\.dismissSearch) var dismissSearch
    @ObservedObject var vm: PeopleVM
    @Binding var query: String
    
    
    var body: some View {
        List {
            Group {
                
                Button("Clear Search") {
                    dismissSearch()
                    handleReset()
                }
                
                Text("Check out our latest promos")
                    .font(.largeTitle)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
        }
        .listStyle(.grouped)
    }
    
    private func handleReset() {
        query = ""
        vm.search()
    }
}


struct EmptyViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewSearch(vm: PeopleVM() ,query: .constant("kldsjfdksj"))
    }
}
