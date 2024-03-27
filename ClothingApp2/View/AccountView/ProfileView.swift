//
//  ProfileView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = UserViewModel()
    
   
    @State var isShowingPassword: Bool = false

    
    @Binding var name:String
    
    var body: some View {
        NavigationStack{
    
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                   
                    
                }
                Section(header: Text("Passwords"), content: {
                    
                    VStack {
                                Group {
                                    if isShowingPassword {
                                        TextField("Enter a password", text: $viewModel.user.password)
                                        TextField("Enter a password", text: $viewModel.user.confirmPassword)
                                    }else {
                                        SecureField("Enter a password", text: $viewModel.user.password)
                                        SecureField("Enter a password", text: $viewModel.user.confirmPassword)
                                    }
                                }
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                
                                Button {
                                    isShowingPassword.toggle()
                                }label: {
                                    if isShowingPassword {
                                        Text("Hide")
                                    }else {
                                        Text("Show")
                                    }
                                }
                            }
                })
                
                Section(header: Text(""), content: {
                    VStack {
                        
                        Button {
                            viewModel.saveChanges()
                        }label: {
                            Text("Save Changes")
                        }
                    }
                })
            }
            
            .navigationTitle("My Profile")
        }
        .onAppear{
            viewModel.retrievUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
        
    }
}

#Preview {
    ProfileView(name: .constant(""))
}
