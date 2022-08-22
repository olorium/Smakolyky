//
//  SmakolykyViewModel.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//

import Foundation

final class SmakolykyListViewModel: ObservableObject {
    
    @Published var smakolykyList: [Smakolyk] = []
    @Published var alertItem: AlertItem?
    
    func getSmakolyky() {
        NetworkManager.shared.getSmakolyky { result in
            DispatchQueue.main.async { [self] in
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
}
