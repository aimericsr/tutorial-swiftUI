//
//  UserModel.swift
//  SwiftUIAPICallMVVMUrlSessionExample
//
//  Created by Tunde Adegoroye on 25/04/2022.
//

import Foundation

struct UserAPI: Codable {
    let id: Int
    let email: String
    let name: String
    let company: CompanyAPI
}

struct CompanyAPI: Codable {
    let name: String
}
