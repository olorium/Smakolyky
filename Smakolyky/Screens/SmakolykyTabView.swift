//
//  ContentView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

/// The tab view with main navigation menu
struct SmakolykyTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            SmakolykyListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            if #available(iOS 15.0, *) {
                OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            } else {
                OrderView()
                    .tabItem { Label("Order", systemImage: "bag") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SmakolykyTabView()
    }
}
