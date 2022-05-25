//
//  PurshaseViewModel.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 09/05/2022.
//

import Foundation

final class PurshaseViewModel: ObservableObject {
    @Published var hasPurshased: Bool = false
    @Published var isLoading: Bool = false
    
    func purshase() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.isLoading = false
            self?.hasPurshased = true
        }
    }
}
