//
//  CodeQuality.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 05/06/2022.
//

import SwiftUI

struct CodeQuality: View {
    var body: some View {
        VStack {
            Form {
                profileSection
            }
            LogoComponant()
        }
    }
}

private extension CodeQuality {
    var profileSection: some View {
        Section("Profile") {
            TextField("FirstName", text: .constant(""))
            TextField("LastName", text: .constant(""))
        }
    }
}

struct CodeQuality_Previews: PreviewProvider {
    static var previews: some View {
        CodeQuality()
    }
}
