//
//  FormScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct FormScreen: View {
    @FocusState private var inputFocused: Bool
    @State private var textEditor: String = ""
    var body: some View {
        NavigationView {
            VStack {
                testForm
                
                SecureField(text: .constant("")) {
                    Text("This is a label")
                }.padding()
                    .textContentType(.username)
                    .focused($inputFocused)
                
                TextField("pwd",
                          text: .constant(""),
                          prompt: Text("Enter someting"))
                .padding()
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.none)
                .focused($inputFocused)
                .submitLabel(.done)
                
                TextEditor(text: $textEditor)
                    .frame(maxHeight: 150)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray.opacity(0.2), lineWidth: 4))
                
                Button {
                    print("new user")
                } label: {
                    Text("Register")
                }.buttonStyle(.borderedProminent)
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(action: resignKeyboard) {
                        Text("Done my MAN !!")
                    }
                }
            }
        .onSubmit(of: .text, submit)
        }
    }
}

struct FormScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormScreen()
    }
}

private extension FormScreen {
    func submit(){
        resignKeyboard()
    }
    
    func resignKeyboard(){
        if #available(iOS 15, *){
            inputFocused = false
        } else {
            dismissKeyboard()
        }
    }
    
    var testForm: some View {
        
        TextField("Name",
                  text: .constant(""),
                  prompt: Text("Enter your name"))
        .padding()
        .focused($inputFocused)
    }
}

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
