//
//  SendButton.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 13/05/2022.
//

import SwiftUI

struct SendButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Send mail")
        }
        .buttonStyle(.sendEmail)
    }
}

struct SendButton_Previews: PreviewProvider {
    static var previews: some View {
        SendButton{}
    }
}
