//
//  SmakolykyListView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

/// A screen with list of items
struct SmakolykyListView: View {
    
    @StateObject var viewModel = SmakolykyListViewModel()
    
    var body: some View {
        ZStack{
            if #available(iOS 15.0, *) {
                NavigationView {
                    List(viewModel.smakolykyList) { smakolyk in
                        SmakolykListItem(smakolyk: smakolyk)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.selectedSmakolyk = smakolyk
                                viewModel.isShowingDetail = true
                            }
                    }
                    .navigationTitle("Smakolyky")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                }
                .task { viewModel.getSmakolykyAsync() }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            } else {
                NavigationView {
                    List(viewModel.smakolykyList) { smakolyk in
                        SmakolykListItem(smakolyk: smakolyk)
                            .onTapGesture {
                                viewModel.selectedSmakolyk = smakolyk
                                viewModel.isShowingDetail = true
                            }
                    }
                    .navigationTitle("Smakolyky")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                }
                .onAppear() { viewModel.getSmakolyky() }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            }

            
            // Present DetailView on cell tap
            if viewModel.isShowingDetail {
                if let selectedItem = viewModel.selectedSmakolyk {
                    SmakolykDetailView(smakolyk: selectedItem, isShowingDetail: $viewModel.isShowingDetail)
                        .transition(.asymmetric(insertion: .opacity.animation(.easeIn), removal: .opacity))
                }
            }
            
            // Present LoadingView while loading data
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
