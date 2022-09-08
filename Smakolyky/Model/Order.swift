//
//  Order.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 08.09.2022.
//

import SwiftUI

final class Order: ObservableObject {
    /// Array of `Smakolyky` we are using to compose order
    @Published var items: [Smakolyk] = []
    
    /// Total price of items in `items` array
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
}
