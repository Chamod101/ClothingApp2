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
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("$\(product.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            }
            .padding(.leading)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        }
    }
}

#Preview {
    CartListCell(product: MockData.sampleProduct)
}
