//
//  UserViewModel.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-24.
//

import SwiftUI

final class UserViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    @State var userAvailable: Bool = false
    
    func saveChanges(){
        guard isValidForm else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.inavliduserData
        }
    }
    
    func retrievUser(){
        guard let userData = userData else {return}
        
        print(userData)
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
           
        } catch{
            alertItem = AlertContext.inavliduserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.password.isEmpty && !user.confirmPassword.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        guard user.password == user.confirmPassword else {
            alertItem = AlertContext.invalidPassword
            return false
        }
        
        return true
    }
    
    
}
