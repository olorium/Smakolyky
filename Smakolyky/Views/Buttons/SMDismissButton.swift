//
//  SMDismissButton.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 04.09.2022.
//

import SwiftUI

/// View for `close` or `dismiss` button
struct SMDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
            
        }
    }
}

struct SMDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        SMDismissButton()
    }
}
