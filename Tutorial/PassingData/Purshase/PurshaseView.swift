//
//  PurshaseView.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import SwiftUI

struct PurshaseView: View {
    @EnvironmentObject var purshaseVm: PurshaseViewModel
    @EnvironmentObject var rooterTab: TabRouter
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        if purshaseVm.isLoading {
            ProgressView()
        }else {
            VStack {
                Button{
                    purshaseVm.purshase()
                } label: {
                    Text("Purshase")
                }
                .disabled(purshaseVm.hasPurshased)
                .opacity(purshaseVm.hasPurshased ? 0.5 : 1)
                
                Button {
                    print(rooterTab.screen)
                    rooterTab.change(to: .pusrshaseState)
                    
                } label: {
                    Text("Go to other tab")
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    launchScreenManager.dismiss()
                }
            }
            
        }
    }
}

struct PurshaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurshaseView()
            .environmentObject(PurshaseViewModel())
            .environmentObject(TabRouter())
            .environmentObject(LaunchScreenManager())
    }
}
