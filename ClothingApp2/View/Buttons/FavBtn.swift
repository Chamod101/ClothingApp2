//
//  FavBtn.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-27.
//

import SwiftUI

struct FavBtn: View {
    var body: some View {
        
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.color2)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .accentColor(.white)
                }
//                .padding(.top, -20)
            
    }
}

#Preview {
    FavBtn()
}
