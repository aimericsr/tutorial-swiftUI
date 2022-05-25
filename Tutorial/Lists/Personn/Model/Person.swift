//
//  Personn.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 21/05/2022.
//

import Foundation

struct Person: Identifiable {
    
    enum Gender: String {
        case male = "👨"
        case female = "👩"
        case genderNeutral = "👱"
    }
    
    let id = UUID()
    let name: String
    let gender: Gender
    var isFavorite: Bool
}

extension Person {
    static var dummyData: [Person] = [
        Person(name: "Billy Bob", gender: .male, isFavorite: false),
        Person(name: "Paschalis Ausma", gender: .male, isFavorite: false),
        Person(name: "Napoleon Donovan", gender: .male, isFavorite: false),
        Person(name: "Woodrow Ortega", gender: .male, isFavorite: false),
        Person(name: "Renee Guzman", gender: .male, isFavorite: false),
        Person(name: "Bradford Powell", gender: .male, isFavorite: false),
        Person(name: "Hattie James", gender: .male, isFavorite: false),
        Person(name: "Eloise Wolfe", gender: .male, isFavorite: false)
    ]
    
}
