//
//  SmakolykyViewModel.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//

import Foundation

final class SmakolykyListViewModel: ObservableObject {
    
    @Published var smakolykyList: [Smakolyk] = []
    
    func getSmakolyky() {
        NetworkManager.shared.getSmakolyky { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let smakolyks):
                    self.smakolykyList = smakolyks
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
