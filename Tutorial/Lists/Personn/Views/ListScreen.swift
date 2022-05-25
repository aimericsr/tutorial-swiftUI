//
//  ListScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct ListScreen: View {
    @State private var query = ""
    @StateObject private var vm: PeopleVM = PeopleVM()
    
    var body: some View {
        NavigationView {
            ListPerson(vm: vm, query: $query)
                .searchable(text: $query)
                .refreshable {
                    await vm.generatePerson()
                }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
