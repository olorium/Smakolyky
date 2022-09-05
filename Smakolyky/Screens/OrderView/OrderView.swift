//
//  OrderView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems: [Smakolyk] = MockData.smakolyky
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { smakolyk in
                        SmakolykListItem(smakolyk: smakolyk)
                    }
                    .onDelete (perform: deleteOrderItem)
                }
                .listStyle(.plain)

                Button {
                    
                } label: {
                    SMButton(title: "Order")
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Order")
        }
    }
    
    func deleteOrderItem(at index: IndexSet) {
        orderItems.remove(atOffsets: index)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
