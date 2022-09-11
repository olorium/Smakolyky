//
//  EmptyStateView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 08.09.2022.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName: String
    let label: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(label)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-order", label: "Default message")
    }
}
