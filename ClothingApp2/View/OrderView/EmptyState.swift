//
//  EmptyState.swift
//  ClothingApp2
//
//  Created by NIBM-LAB04-PC05 on 2024-03-25.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName : String
    var lable : String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text(lable)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

#Preview {
    EmptyState(imageName: "PlaceHolder", lable: "You don't have any items in the cart")
}
