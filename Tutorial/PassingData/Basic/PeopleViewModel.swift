//
//  PeopleViewModel.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published var people: [String] = []
    @Published var isLoading: Bool = false
    
    func fetchPeople() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.people = ["Jean", "Louis"]
            self?.isLoading = false
        }
    }
    
    
}
