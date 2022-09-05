//
//  User.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 05.09.2022.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var extraCheese = false
}
