//
//  User.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 03/07/25.
//

import Foundation

struct User: Codable {
    var username: String = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var dateOfBirth = Date()
    var extraNapkins = false
    var frequentRefills = false
}


// user -> data -> UserDefaults (encoding user to data & give to UserDefaults)
// UserDefaults -> data -> user (decoding UserDefaults
