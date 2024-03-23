//
//  ProfileView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    
    @Binding var name:String
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    TextField("Enter your password", text: $lastName)
                    TextField("Confirm your password", text: $lastName)
                    Button{
                        name = firstName+""+lastName+""+email
                    } label: {
                        Text("Save Changes")
                    }
                }
            }
            
            .navigationTitle("My Profile")
        }
        
    }
}

#Preview {
    ProfileView(name: .constant(""))
}
