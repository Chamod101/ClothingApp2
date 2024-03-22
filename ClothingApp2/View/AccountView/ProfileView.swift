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
                    Button{
                        print("Save")
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
    ProfileView()
}
