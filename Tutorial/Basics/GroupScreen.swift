//
//  GroupScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct GroupScreen: View {
    var body: some View {
        VStack {
            GroupBox{
                Text("item 1")
            } label: {
                Label("Your items", systemImage: "star")
            }
            
            GroupBox{
                Text("item 1")
            } label: {
                Label("Your items", systemImage: "star")
            }
            .groupBoxStyle(.saved)
            
            ScrollView{
                VStack(spacing: 20) {
                    Text("Quantity")
                    ControlGroup{
                        increaseBtn
                        decreaseBtn
                    }
                    
                    ControlGroup{
                        increaseBtn
                        decreaseBtn
                    }
                    .controlGroupStyle(.navigation)
                    
                    ControlGroup{
                        increaseBtn
                        decreaseBtn
                    }
                    .controlGroupStyle(.quantity)
                }
            }
        }
        .padding()
        .background(.mint)
    }
}

struct GroupScreen_Previews: PreviewProvider {
    static var previews: some View {
        GroupScreen()
    }
}

private extension GroupScreen {
    var increaseBtn: some View {
        Button {
        } label: {
            Label("Increase", systemImage: "plus")
        }
    }
    
    var decreaseBtn: some View {
        Button {
        } label: {
            Label("Decrease", systemImage: "minus")
        }
    }
}
