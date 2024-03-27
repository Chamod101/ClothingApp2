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
                        .foregroundColor(.favColour)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "heart")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
                .padding(.top, -20)
            
    }
}

#Preview {
    FavBtn()
}
