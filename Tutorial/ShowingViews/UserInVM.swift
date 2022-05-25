//
//  UserInputViewModel.swift
//  PresentingAnDismissingViewsInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import Foundation

struct UserInfoShowView: Identifiable {
    
    enum Gender: String, Identifiable, CaseIterable {
        var id: Self { self }
        case male
        case female
        case preferNotToSay = "Prefer not to say"
    }
    
    let id = UUID()
    var firstName: String
    var lastName: String
    var gender: Gender
}

extension UserInfoShowView {
    
    static var empty = UserInfoShowView(firstName: "", lastName: "", gender: .male)
}

final class UserInVM: ObservableObject {
    
    @Published var user: UserInfoShowView = .empty
}
