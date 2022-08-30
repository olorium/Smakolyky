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
        ZStack{
            NavigationView {
                List(viewModel.smakolykyList) { smakolyk in
                    SmakolykListItem(smakolyk: smakolyk)
                }
                .navigationTitle("Smakolyky")
            }
            .onAppear() { viewModel.getSmakolyky()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
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
