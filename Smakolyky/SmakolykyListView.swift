//
//  SmakolykyListView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct SmakolykyListView: View {
    
    @StateObject var viewModel = SmakolykyListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.smakolykyList) { smakolyk in
                SmakolykListItem(smakolyk: smakolyk)
            }
                .navigationTitle("Smakolyky")
        }
        .onAppear() { viewModel.getSmakolyky() }
    }
}

struct SmakolykyListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SmakolykyListView()
        }
    }
}
