//
//  AccountView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account")
                .navigationTitle("Account")
        }
    }
}

struct AcountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
