//
//  Date+Ext.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 17.09.2022.
//

import Foundation

/// Extends `Date` for better UX in `DatePicker`
extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
