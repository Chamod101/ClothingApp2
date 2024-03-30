//
//  CartListCell.swift
//  ClothingApp2
//
//  Created by NIBM-LAB04-PC05 on 2024-03-25.
//

import SwiftUI

struct CartListCell: View {
    
    let product: Product
    
    var body: some View {
        HStack{
           
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .font(.system(size: 15, weight: .medium, design: .serif))
                    .fontWeight(.bold)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Category - \(product.category)")
                    .font(.system(size: 13, weight: .medium, design: .serif))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text("$\(product.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            }
            Spacer()
                .padding(.horizontal)
            
        
        }
        .padding(15)
        .padding(.leading)
    }
}

#Preview {
    CartListCell(product: MockData.sampleProduct)
}
