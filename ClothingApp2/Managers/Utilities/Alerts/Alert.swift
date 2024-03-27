//
//  Alert.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
        
    static let invalidDatea = AlertItem(
        title: Text("Server Error"),
        message: Text("The data recived from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later."),
        dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue with connecting to the server. If this is persists, please contact support."),
        dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at the time.Please check your internet connection"),
        dismissButton: .default(Text("OK")))
    
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please ensure all fields in the form have been filled out"),
        dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please ensure your email is correct."),
        dismissButton: .default(Text("OK")))
    
    
    static let invalidPassword = AlertItem(
        title: Text("Invalid Password"),
        message: Text("Please ensure password and confirm password are same"),
        dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile information was successfully saved."),
        dismissButton: .default(Text("OK")))
    
    static let inavliduserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving or retrieving your profile data."),
        dismissButton: .default(Text("OK")))
    
    static let invalidUser = AlertItem(
        title: Text("Profile Error"),
        message: Text("Please create an account beforethis acction"),
        dismissButton: .default(Text("OK")))
}
