//
//  PurshaseStateView.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import SwiftUI

struct PurshaseStateView: View {
    @EnvironmentObject var purshaseVm: PurshaseViewModel
    
    var body: some View {
        PurshaseStatusView()
    }
}

struct PurshaseStateView_Previews: PreviewProvider {
    static var previews: some View {
        PurshaseStateView()
            .environmentObject(PurshaseViewModel())
    }
}
