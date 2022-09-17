//
//  SmakolykyViewModel.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//

import Foundation

/// View model for list view
@MainActor final class SmakolykyListViewModel: ObservableObject {
    
    @Published var smakolykyList: [Smakolyk] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedSmakolyk: Smakolyk?
    
    /// Creating a network call and fetching item array
    func getSmakolyky() {
        isLoading = true
        NetworkManager.shared.getSmakolyky { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let smakolyks):
                    smakolykyList = smakolyks
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    
                    case .invalidData:
                        alertItem = AlertContext.invalidResponse
                    
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    /// Creating a network call and fetching item array using async version
    func getSmakolykyAsync() {
        isLoading = true
        Task {
            do {
                smakolykyList = try await NetworkManager.shared.getSmakolykyAsync()
                isLoading = false
            } catch {
                if let error = error as? SMError {
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
