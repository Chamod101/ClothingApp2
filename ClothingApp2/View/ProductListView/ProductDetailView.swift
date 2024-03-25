//
//  ProductDetailView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-22.
//

import SwiftUI



struct ProductDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let product: Product
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack{
            
            
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 270)
            
            ScrollView{
                VStack{
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(product.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                }
                
                HStack(spacing: 40){
                    ProductCountDetails(
                        title: "Colour",
                        value: product.colour)
                   
                    ProductCountDetails(
                        title: "Size",
                        value: product.size)
                    
                    ProductCountDetails(
                        title: "Category",
                        value: product.category)
                  
                }
            }
            
            
            Spacer()
            Button{
                order.add(product)
                isShowingDetails = false
            } label: {
                ProductBtn(title: "$\(product.price, specifier: "%.2f") - Add to Cart")
            }
            .padding(.bottom,30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
        .overlay(
            Button{
                isShowingDetails = false
            } label: {
                DismissBtn()
            },
            alignment: .topTrailing
        )
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct, isShowingDetails: .constant(true))
}

struct ProductCountDetails: View {
    
    let title: String
    let value:String
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
