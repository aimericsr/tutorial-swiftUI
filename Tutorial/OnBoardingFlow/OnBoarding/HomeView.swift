//
//  HomeView.swift
//  TestProject
//
//  Created by Tunde Adegoroye on 29/01/2022.
//

import SwiftUI

enum Screen {
    case purshase
    case pusrshaseState
    case rootLogin
    case form
}

final class TabRouter: ObservableObject {
    @Published var screen: Screen = .purshase
    
    func change(to screen: Screen){
        self.screen = screen
    }
}

struct HomeView: View {
    
    @StateObject var sheetManager = SheetManager()
    @StateObject var launchScreenManager = LaunchScreenManager()
    @StateObject private var vm = PurshaseViewModel()
    @StateObject private var router = TabRouter()
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        
                    ZStack {
                        TabView(selection: $router.screen) {
                            //need to stop the launchScreen animation
                            PurshaseView()
                                .badge(4)
                                .tag(Screen.purshase)
                                .tabItem {
                                    Label("Purshased", systemImage: "creditcard")
                                }
                            ThemeView()
                                .tag(Screen.pusrshaseState)
                                .tabItem {
                                    Image(systemName: "gear")
                                    Text("State")
                                }
                            AsyncImageCustom()
                                .tag(Screen.rootLogin)
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("Loging")
                                }
                            LazyGridScreen()
                                .tag(Screen.form)
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("iTest")
                                }
                        }
                        .environmentObject(vm)
                        .environmentObject(router)
                        .environmentObject(sheetManager)
        
                        if launchScreenManager.state != .completed {
                            LaunchScreenView()
                        }
                    }
                    .environmentObject(launchScreenManager)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SessionManager())
    }
}
