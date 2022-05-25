//
//  TutorialApp.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 22/05/2022.
//

import SwiftUI

@main
struct SampleAppApp: App {
    @StateObject private var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
                .environmentObject(session)
        }
    }
}
