//
//  Smakolyk.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import Foundation

/// The model for the food item
struct Smakolyk: Codable {
    let id: Int
    let name: String
    let descriptio: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
