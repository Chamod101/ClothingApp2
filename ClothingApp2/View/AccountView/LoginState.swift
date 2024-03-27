//
//  LoginState.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-27.
//

import SwiftUI

struct LoginState: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack{
                Image("log")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Please create an account ")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    
                }, label: {
                    Text("Create Account")
                })
            }
            
        }
    }
}

#Preview {
    LoginState()
}
