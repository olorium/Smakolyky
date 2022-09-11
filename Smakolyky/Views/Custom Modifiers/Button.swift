//
//  Button.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 11.09.2022.
//

import SwiftUI

struct StandarDButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .buttonStyle(.bordered)
                .tint(.brandPrimary)
                .controlSize(.large)
        }
    }
}
