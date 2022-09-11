//
//  AccountView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct AccountView: View {
  
    ///Enum for tracking focus on text fields
    enum FormTextField {
        case firstName, lastName, email
    }
    
    @StateObject var viewModel = AccountViewModel()
    @available(iOS 15.0, *) @FocusState private var focusTextField: FormTextField?
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                Form {
                    Section {
                        TextField("First Name", text: $viewModel.user.firstName)
                            .focused($focusTextField, equals: .firstName)
                            .onSubmit { focusTextField = .lastName }
                            .submitLabel(.next)
                        TextField("Last Name", text: $viewModel.user.lastName)
                            .focused($focusTextField, equals: .lastName)
                            .onSubmit { focusTextField = .email }
                            .submitLabel(.next)
                        TextField("Email", text: $viewModel.user.email)
                            .focused($focusTextField, equals: .email)
                            .onSubmit { focusTextField = nil }
                            .submitLabel(.next)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                        
                    } header: {
                        Text("Personal Details")
                    }
                    
                    Section {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Extra cheese", isOn: $viewModel.user.extraCheese)
                        
                    } header: {
                        Text("Requests")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    
                }
                .navigationTitle("Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusTextField = nil }
                        .tint(.red)
                    }
                }
            }
            .onAppear {
                viewModel.retrieveUser()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        } else {
            NavigationView {
                Form {
                    Section {
                        TextField("First Name", text: $viewModel.user.firstName)
                        TextField("Last Name", text: $viewModel.user.lastName)
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                        
                    } header: {
                        Text("Personal Details")
                    }
                    
                    Section {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Extra cheese", isOn: $viewModel.user.extraCheese)
                        
                    } header: {
                        Text("Requests")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    
                }
                .navigationTitle("Account")
            }
            .onAppear {
                viewModel.retrieveUser()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct AcountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
