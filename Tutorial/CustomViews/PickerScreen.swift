//
//  PickerScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 16/05/2022.
//

import SwiftUI

enum Anime: CaseIterable, Identifiable, Hashable {
    case demonSlayer
    case attackOnTitan
    case bokuNoHero
    
    var id: Self { self }
}

extension Anime {
    var title: String {
        switch self {
        case .demonSlayer:
            return "Demon Slayer"
        case .attackOnTitan:
            return "Attack on Titan"
        case .bokuNoHero:
            return "My Hero Academia"
        }
    }
}

struct Flavour: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Decimal
}

extension Flavour {
    static let none: Flavour = .init(name: "", price: 0)
}

struct PickerScreen: View {
    private let names: [Flavour] = [
        Flavour(name: "Vanilla", price: 1.00),
        Flavour(name: "Mint", price: 1.50),
        Flavour(name: "Strawberry", price: 2.00)
    ]
    @State private var selectedFlavour: Flavour = .none
    
    @State private var selectedAnime: Anime = Anime.allCases.first!
    
    var body: some View {
        VStack {
            Text("Selected name \(selectedFlavour.name)")
            //change if picker in list or not
            List {
                Picker("Choose a flavour", selection: $selectedFlavour) {
                    ForEach(names) { item in
                        HStack {
                            Text(item.name)
                            Text(item.price, format: .currency(code: "EUR"))
                        }
                        .tag(item)
                    }
                }
                .pickerStyle(.inline)
                
                
                Picker("Choose a flavour", selection: $selectedFlavour) {
                    ForEach(names) { item in
                        HStack {
                            Text(item.name)
                            Text(item.price, format: .currency(code: "EUR"))
                        }
                        .tag(item)
                    }
                }
                .pickerStyle(.wheel)
            }
            
            Picker("Choose a anime", selection: $selectedAnime) {
                ForEach(Anime.allCases) { item in
                    Text(item.title)
                        .tag(item)
                }
            }.pickerStyle(.menu)
            
        }
    }
}

struct PickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickerScreen()
    }
}
