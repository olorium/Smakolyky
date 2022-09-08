//
//  SmakolykyApp.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

@main
struct SmakolykyApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            SmakolykyTabView().environmentObject(order)
        }
    }
}
