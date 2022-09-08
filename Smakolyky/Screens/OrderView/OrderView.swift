//
//  OrderView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { smakolyk in
                            SmakolykListItem(smakolyk: smakolyk)
                        }
                        .onDelete (perform: deleteOrderItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        SMButton(title: "Place Order: \(order.totalPrice, specifier: "%.2f")")
                    }
                    .padding(.bottom, 30)
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", label: "You have no items in your order.\nPlease add some first.")
                        .transition(.asymmetric(insertion: .slide.animation(.easeIn), removal: .opacity))
                }
            }
            .navigationTitle("Order")
        }
    }
    
    func deleteOrderItem(at index: IndexSet) {
        order.items.remove(atOffsets: index)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
