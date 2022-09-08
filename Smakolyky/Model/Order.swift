//
//  Order.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 08.09.2022.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Smakolyk] = []
}
