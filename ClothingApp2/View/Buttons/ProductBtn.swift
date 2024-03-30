//
//  ProductBtn.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-22.
//

import SwiftUI

struct ProductBtn: View {

    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .medium, design: .serif))
            .fontWeight(.semibold)
            .frame(width: 240, height: 50)
            .foregroundColor(.white)
            .background(.color3)
            .cornerRadius(50)
    }
}

#Preview {
    ProductBtn(title: "Test title")
}
