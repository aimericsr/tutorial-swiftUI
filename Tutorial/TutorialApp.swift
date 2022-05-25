//
//  TutorialApp.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 22/05/2022.
//

//import SwiftUI
//
//@main
//struct TutorialApp: App {
//
//    @StateObject var launchScreenManager = LaunchScreenManager()
//
//    var body: some Scene {
//        WindowGroup {
//            ZStack {
//                ContentView()
//
//                if launchScreenManager.state != .completed {
//                    LaunchScreenView()
//                }
//            }
//            .environmentObject(launchScreenManager)
//        }
//    }
//}

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

@main
struct SampleAppApp: App {
    
    
    @StateObject var sheetManager = SheetManager()
    @StateObject var launchScreenManager = LaunchScreenManager()
    @StateObject private var vm = PurshaseViewModel()
    @StateObject private var router = TabRouter()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabView(selection: $router.screen) {
                    PurshaseView()
                        .badge(4)
                        .tag(Screen.purshase)
                        .tabItem {
                            Label("Purshased", systemImage: "creditcard")
                        }
                    FormRoot()
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
}
