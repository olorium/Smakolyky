//
//  SmakolykyListView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct SmakolykyListView: View {
    var body: some View {
        NavigationView {
            Text("List")
                .navigationTitle("Smakolyky")
        }
    }
}

struct SmakolykyListView_Previews: PreviewProvider {
    static var previews: some View {
        SmakolykyListView()
    }
}
