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
    
    @StateObject private var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
                .environmentObject(session)

        }
    }
}
