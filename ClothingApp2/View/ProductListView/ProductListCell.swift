//
//  ProductListCell.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: Product
    
    var body: some View {
        VStack{
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(product.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ProductListCell(product: MockData.sampleProduct)
}
