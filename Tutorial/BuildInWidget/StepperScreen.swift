//
//  StepperScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct StepperScreen: View {
    @State private var quantity: Int = 0
    var body: some View {
        VStack {
            Text("recipe for \(quantity) persons")
            
            Stepper("test", value: $quantity, in: 0...20, step: 1)
                .labelsHidden()
            
            Stepper(value: $quantity, in: 0...20, step: 1){
                Image(systemName: "scooter")
            } onEditingChanged: { editingStarted in
                print("The value changed \(editingStarted), the current quantity is \(quantity)")
            }
        }
    }
}

struct StepperScreen_Previews: PreviewProvider {
    static var previews: some View {
        StepperScreen()
    }
}
