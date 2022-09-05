//
//  AccountViewModel.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 05.09.2022.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
   
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    /// Return `true` is we all text fields is valid
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    /// Save input values from Account form fields
    func saveChanges() {
        guard isValidForm else { return }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.userSaveError
        }
        
    }
    
    /// Retrieving user data from UserDefaults
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.userSaveError
        }
    }
}
