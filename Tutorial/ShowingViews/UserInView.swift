//
//  UserInputView.swift
//  PresentingAnDismissingViewsInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import SwiftUI

struct UserInView: View {
    
    @StateObject private var vm = UserInVM()
    
    @State private var newUserInfoSheet: UserInfoShowView?
    @State private var newUserInfoFullScreen: UserInfoShowView?
    @State private var newUserInfoPopover: UserInfoShowView?

    var body: some View {
        
        VStack {
            
            TextField("First name", text: $vm.user.firstName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Last name", text: $vm.user.lastName)
                .textFieldStyle(.roundedBorder)
            
            Picker("", selection: $vm.user.gender) {
                ForEach(UserInfo.Gender.allCases) { item in
                    Text(item.rawValue.uppercased())
                }
            }
            .pickerStyle(.wheel)
            
            sheetExample
            fullScreenExample
            popoverExample
            
        }
        .padding()
        .sheet(item: $newUserInfoSheet) {
            print("Did dismiss")
        } content: { item in
            userDetailInfo(item)
                .interactiveDismissDisabled(true)
        }
        .fullScreenCover(item: $newUserInfoFullScreen) {
            print("Did dismiss")
        } content: { item in
            userDetailInfo(item)
        }
        .popover(item: $newUserInfoPopover,
                 attachmentAnchor: .point(.top),
                 arrowEdge: .top) { item in
            userDetailInfo(item)
        }

    }
}

struct UserInView_Previews: PreviewProvider {
    static var previews: some View {
        UserInView()
    }
}

private extension UserInView {
    
    var sheetExample: some View {
        Button("Submit Sheet") {
            newUserInfoSheet = vm.user
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    var fullScreenExample: some View {
        Button("Submit Fullscreen") {
            newUserInfoFullScreen = vm.user
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }

    
    var popoverExample: some View {
        Button("Submit Popover") {
            newUserInfoPopover = vm.user
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

private extension UserInView {
    
    func userDetailInfo(_ item: UserInfoShowView) -> some View {
        VStack {
            
            Text("User info")
                .font(.largeTitle)
            Text("First name: \(item.firstName)")
            Text("Last name: \(item.lastName)")
            Text("Gender: \(item.gender.rawValue)")

            Button("Reset") {
                newUserInfoSheet = nil
                newUserInfoFullScreen = nil
                newUserInfoPopover = nil
            }
        }
    }
}
