//
//  AlertScreen`.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 19/05/2022.
//

import SwiftUI

struct AlertScreen: View {
    @State private var showAlert: Bool = false
    
    @State private var showAlertFile: Bool = false
    @State private var fileName: String = ""
    
    @StateObject var manager = NetworkManager()
    var body: some View {
        //simpleAlertSystem
        //fileManagerAlert
        networkErrorExemple
    }
}

struct AlertScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlertScreen()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}

private extension AlertScreen {
    var networkErrorExemple: some View {
        VStack {
            Text("Api call")
                .onAppear(perform: manager.fetch)
                
                .alert(isPresented: $manager.hasError,
                       error: manager.error) { error in
                    
                    Button {
                        manager.fetch()
                    } label: {
                        Text(error.suggestion)
                    }

                } message: { error in
                    Text(error.message)
                }

        }
        
            
    }
}

private extension AlertScreen {
    var fileManagerAlert: some View {
        VStack {
            TextField("Filename", text: $fileName)
                .textFieldStyle(.roundedBorder)
            Button("Remove"){
                showAlertFile.toggle()
            }
        }
        .padding()
        .alert("Remove file", isPresented: $showAlertFile, presenting: fileName) { file in
            Button(role: .destructive){
                
            } label: {
                Text("Remove \(file)")
            }
        } message: { file in
            Text("You're currently trying to remove the file \(file)")
        }
    }
}

private extension AlertScreen {
    var simpleAlertSystem: some View {
        VStack {
            Button {
                showAlert.toggle()
            } label: {
                Text("You want to see the alert ?")
            }
            .buttonStyle(.borderedProminent)
        }
        .alert("Agree to Terms",
               isPresented: $showAlert,
               actions: {
            //            Button(role: .cancel) {
            //
            //            } label: {
            //                Text("Cancel")
            //            }
            
            Button(role: .destructive) {
            } label: {
                Text("Reject")
            }
            
            Button {
            } label: {
                Text("Confirm")
            }
        }, message: {
            Text("This is a message")
        })
    }
}
