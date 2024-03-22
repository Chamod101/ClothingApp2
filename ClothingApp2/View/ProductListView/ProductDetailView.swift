//
//  ProductDetailView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-22.
//

import SwiftUI



struct ProductDetailView: View {
    
    let product: Product
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack{
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 270)
            
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
                VStack(spacing: 5){
                    Text("Caleries")
                        .bold()
                        .font(.caption)
                    
                    Text("\(product.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack(spacing: 5){
                    Text("Caleries")
                        .bold()
                        .font(.caption)
                    
                    Text("\(product.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack(spacing: 5){
                    Text("Caleries")
                        .bold()
                        .font(.caption)
                    
                    Text("\(product.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            
            Spacer()
            Button{
                print("taped")
            } label: {
                Text("$\(product.price, specifier: "%.2f") - Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 240, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
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
            },
            alignment: .topTrailing
        )
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct, isShowingDetails: .constant(true))
}
