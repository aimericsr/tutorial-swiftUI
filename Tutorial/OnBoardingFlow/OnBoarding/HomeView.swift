//
//  HomeView.swift
//  TestProject
//
//  Created by Tunde Adegoroye on 29/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        
        //            ZStack {
        //                TabView(selection: $router.screen) {
        //                    PurshaseView()
        //                        .badge(4)
        //                        .tag(Screen.purshase)
        //                        .tabItem {
        //                            Label("Purshased", systemImage: "creditcard")
        //                        }
        //                    FormRoot()
        //                        .tag(Screen.pusrshaseState)
        //                        .tabItem {
        //                            Image(systemName: "gear")
        //                            Text("State")
        //                        }
        //                    AsyncImageCustom()
        //                        .tag(Screen.rootLogin)
        //                        .tabItem {
        //                            Image(systemName: "person.fill")
        //                            Text("Loging")
        //                        }
        //                    LazyGridScreen()
        //                        .tag(Screen.form)
        //                        .tabItem {
        //                            Image(systemName: "person.fill")
        //                            Text("iTest")
        //                        }
        //                }
        //                .environmentObject(vm)
        //                .environmentObject(router)
        //                .environmentObject(sheetManager)
        //
        //                if launchScreenManager.state != .completed {
        //                    LaunchScreenView()
        //                }
        //            }
        //            .environmentObject(launchScreenManager)
        
        VStack(spacing: 16) {
            Text("[Home Content Here]")
                .font(.system(size: 20,
                              weight: .heavy,
                              design: .rounded))
            Button("Sign Out") {
                session.signOut()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SessionManager())
    }
}
