//
//  PurshaseStatusView.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import SwiftUI

struct PurshaseStatusView: View {
    @EnvironmentObject var purshaseVm: PurshaseViewModel
    
    var body: some View {
        VStack {
            Image(systemName: purshaseVm.hasPurshased ? "lock.open" : "lock")
                .font(.system(size: 50, weight: .bold))
                .symbolVariant(.fill)
            Text("The user hasn't unlocked this feature")
        }
    }
}

struct PurshaseStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PurshaseStatusView()
            .environmentObject(PurshaseViewModel())
    }
}
