//
//  LoginNotificationView.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI

struct LoginNotificationView: View {
    
    @State var bodyText: String
    
    var body: some View {
        VStack{
          
            VStack{
                Image("loginImg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text("")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(bodyText)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }

            Button{
                print("taped")
            } label: {
                ProductBtn(title: "LOGIN")
            }
            .padding(.bottom,70)
        }
        .frame(width: 300, height: 400)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
    }
}

#Preview {
    LoginNotificationView(bodyText: "test")
}


