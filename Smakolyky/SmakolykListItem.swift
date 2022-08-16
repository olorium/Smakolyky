//
//  SmakolykListItem.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct SmakolykListItem: View {
    
    let smakolyk: Smakolyk
    
    var body: some View {
        HStack {
            Image("meatballs")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                Text(smakolyk.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$ \(smakolyk.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct SmakolykListItem_Previews: PreviewProvider {
    static var previews: some View {
        SmakolykListItem(smakolyk: MockData.sampleSmakolyk)
    }
}
