//
//  AccountView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 16.08.2022.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthday = Date()
    @State private var extraNapkins = false
    @State private var extraCheese = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    Button {
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Details")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Extra cheese", isOn: $extraCheese)
                        
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))

            }
            .navigationTitle("Account")
        }
    }
}

struct AcountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
