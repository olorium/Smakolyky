//
//  Alert.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//

import SwiftUI

/// Alert object for error alerts in the app
struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDada = AlertItem(title: Text("Server Error"), message: Text("The data received from the server is invalid. Please contact support"), dismissButton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("Ok")))
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The was an issue connecting to the server. Please contact support"), dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete request. Please check your internet connection"), dismissButton: .default(Text("Ok")))
}
