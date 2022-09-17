//
//  OrderView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

/// Order screen view
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
                    if #available(iOS 15.0, *) {
                        Button {
                           
                        } label: {
                            Text("Place Order: $\(order.totalPrice, specifier: "%.2f")")
                        }
                        .modifier(StandarDButtonStyle())
                        .padding(.bottom, 30)
                    } else {
                        Button {
                            
                        } label: {
                            SMButton(title: "Place Order: $\(order.totalPrice, specifier: "%.2f")")
                        }
                        .padding(.bottom, 30)
                    }
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", label: "You have no items in your order.\nPlease add some first.")
                        .transition(.asymmetric(insertion: .slide.animation(.easeIn), removal: .opacity))
                }
            }
            .navigationTitle("Order")
        }
    }
    
    /// Method for removing order items
    func deleteOrderItem(at index: IndexSet) {
        order.items.remove(atOffsets: index)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
