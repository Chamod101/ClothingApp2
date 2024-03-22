//
//  DismisBtn.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-22.
//

import SwiftUI

struct DismissBtn: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    DismissBtn()
}
