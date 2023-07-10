//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    let service = DealsService()
    var cancellables = Set<AnyCancellable>()
    // Call the fetch call using DealsService
    @MainActor func getDeals() {
        Task {
            do {
                deals = try service.fetchDeals()
            } catch {
                if let error = error as? APIError {
                    print(error)
                } else {
                    print(error)
                }
            }
        }
    }
    
    func getMostPopularDeal() -> Deal? {
        if let mostPopular = deals.max(by: { $0.likes?.count ?? 0 < $1.likes?.count ?? 0 }) {
            return mostPopular
        } else {
            return nil
        }
    }
}
