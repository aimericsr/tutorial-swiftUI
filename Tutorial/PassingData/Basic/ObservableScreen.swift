//
//  ObservableScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import SwiftUI

struct ObservableScreen: View {
    @StateObject private var vm = PeopleViewModel()
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
                Text("Loading ...")
            }else {
                Text(vm.people.isEmpty ? "No people" : "Sucess : \(vm.people.count) person found !")
            }
            Button(action: vm.fetchPeople) {
                Text("Fetch some people")
                    .foregroundColor(.black)
                    
            }
        }
    }
}

struct ObservableScreen_Previews: PreviewProvider {
    static var previews: some View {
        ObservableScreen()
    }
}
