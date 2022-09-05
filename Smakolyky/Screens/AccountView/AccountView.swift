//
//  AccountView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Details")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Extra cheese", isOn: $viewModel.extraCheese)
                        
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))

            }
            .navigationTitle("Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AcountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
