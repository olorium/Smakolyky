//
//  AccountViewModel.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 05.09.2022.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
   
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var extraCheese = false
    
    @Published var alertItem: AlertItem?
    
    /// Return `true` is we all text fields is valid
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    /// Save input values from Account form fields
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes saved")
        
    }
}
