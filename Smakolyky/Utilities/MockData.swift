//
//  MockData.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import Foundation

struct MockData {
    
    static let sampleSmakolyk = Smakolyk(id: Int.random(in: 0...10),
                                         name: "The best Smakolyk",
                                         description: "Crusty and very tasty, free of charge. This food is the best for parties and regular lunches.",
                                         price: 990.00,
                                         imageURL: "https://raw.githubusercontent.com/olorium/Smakolyky/main/Remote/images/chicken-dumplings.jpg",
                                         calories: 50,
                                         protein: 60,
                                         carbs: 70)
    
    static let smakolyky = [sampleSmakolyk, sampleSmakolyk, sampleSmakolyk, sampleSmakolyk]
}
