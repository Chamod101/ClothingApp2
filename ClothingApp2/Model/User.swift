//
//  User.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var password: String = ""
    var confirmPassword: String = ""
}
