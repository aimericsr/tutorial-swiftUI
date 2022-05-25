//
//  PersonViewModel.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import Foundation
import SwiftUI

// MARK: - Models
// simple personn
/*
 multine comments
 */

@MainActor
final class PeopleVM: ObservableObject {
    
    /// Stock list of personns
    @Published private(set) var people: [Person] = [Person(name: "Billy Bob", gender: .male, isFavorite: false)]
    @Published var filterdData = [Person]()
    var favouritesItems: [Person] { people.filter{ $0.isFavorite } }
    @Published private(set) var isLoading = false
    @Published var showConfirmation: Bool = false
    @Published var selectedPerson: Person?
    
    
    
    /// add a new personn to the list
    func generatePerson() async {
        isLoading = true
        Task {
            Thread.sleep(forTimeInterval: 1.5)
            withAnimation {
                people.append(Person.dummyData.randomElement()!)
                search()
                isLoading = false
            }
        }
    }
    
    func search(with query: String = "") {
        filterdData = query.isEmpty ? people : people.filter { $0.name.contains(query) }
    }
    
    func addToFavorite(for item: Person) {
        if let index = people.firstIndex(where: { $0.id == item.id }) {
            people[index].isFavorite.toggle()
        }
        search()
    }
    
    func deleteWithIndex(_ indexSet: IndexSet){
        people.remove(atOffsets: indexSet)
    }
    
    func move(from currentIndexSet: IndexSet, to newIndex: Int){
        people.move(fromOffsets: currentIndexSet, toOffset: newIndex)
    }
    
    func delete(_ item: Person){
        withAnimation {
            people.removeAll(where: { $0.id == item.id })
        }
        search()
    }
    
    /// Function for testing the documentation
    /// - Parameter item: Give any Int value
    /// - Parameter item2: Give any String value
    /// - Returns: Return the same Int given in the function
    func getValue(item: Int, item2: String) -> Int { item }
}
