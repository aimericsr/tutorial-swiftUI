//
//  PrivateVarView.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 05/06/2022.
//

import SwiftUI

final class CounterViewModel: ObservableObject {
    // use private set
    @Published private(set) var counter = 0
    
    func increase(){
        counter += 1
    }
}

struct PrivateVarView: View {
    // use private
    @StateObject private var vm = CounterViewModel()
    var body: some View {
        VStack {
            Text("\(vm.counter)")
            Button("Increase", action: vm.increase)
                .buttonStyle(.bordered)
        }
    }
}

struct PrivateVarView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateVarView()
    }
}
