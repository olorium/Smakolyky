//
//  SMButton.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 04.09.2022.
//

import SwiftUI

struct SMButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct SMButton_Previews: PreviewProvider {
    static var previews: some View {
        SMButton(title: "Button")
    }
}
