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
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 240, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}

#Preview {
    ProductBtn(title: "Test title")
}
