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
        title: Text("Invalid Device Input"),
        message: Text("Something is wrong with the camers. We are unable to capture the input"),
        dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(
        title: Text("Invalid Device Input"),
        message: Text("Something is wrong with the camers. We are unable to capture the input"),
        dismissButton: .default(Text("OK")))
}
