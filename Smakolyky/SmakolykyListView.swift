//
//  SmakolykyListView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct SmakolykyListView: View {
    
    @State private var smakolykyList: [Smakolyk] = []
    
    var body: some View {
        NavigationView {
            List(smakolykyList) { smakolyk in
                SmakolykListItem(smakolyk: smakolyk)
            }
                .navigationTitle("Smakolyky")
        }
        .onAppear() { getSmakolyky() }
    }
    
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

struct SmakolykyListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SmakolykyListView()
        }
    }
}
