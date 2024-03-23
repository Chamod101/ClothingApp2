//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
    @Binding var isDark : Bool
    @Binding var name: String
    
    var body: some View {
        
        ZStack{
            if(name == ""){
                VStack{
                  
                    VStack{
                        Text("Please Create a account")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Login first")
                            .multilineTextAlignment(.center)
                            .font(.body)
                            .padding()
                    }

                    
                    Spacer()
                    Button{
                        print("taped")
                    } label: {
                        ProductBtn(title: "Please Create a account")
                    }
                    .padding(.bottom,30)
                }
                .frame(width: 300, height: 525)
                .background(Color(.systemBackground))
                .cornerRadius(15)
                .shadow(radius: 40)
            }
        }
        
    }
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
