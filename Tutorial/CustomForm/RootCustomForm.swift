//
//  ContentView.swift
//  TestProject
//
//  Created by Tunde Adegoroye on 29/01/2022.
//

import SwiftUI

struct RootCustomForm: View {
    
    @State private var showForm: Bool = false

    @StateObject private var contactFormManager = FormManager()
    @StateObject private var loginFormManager = LoginFormManager()

    var body: some View {
        Button("Show form") {
            showForm.toggle()
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .sheet(isPresented: $showForm) {
            FormView(title: "Login",
                     manager: loginFormManager) { data in
                showForm.toggle()
                dump(data)
            }
        }
    }
}

struct RootCustomForm_Previews: PreviewProvider {
    static var previews: some View {
        RootCustomForm()
    }
}
