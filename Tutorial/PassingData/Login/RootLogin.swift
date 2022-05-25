//
//  ContentView.swift
//  StateObjectInSwiftUI
//
//  Created by Tunde on 16/01/2022.
//

import SwiftUI

struct RootLogin: View {
    
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        
        switch vm.state {
        case .loading:
            ProgressView()
        case .notLoggedIn:
//            LoginView(user: $vm.user){
//                vm.login()
//            }
            LoginView(vm: vm)
        case .loggedIn:
            LoggedInView {
                vm.logout()
            }
        }
    }
}

struct RootLogin_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
