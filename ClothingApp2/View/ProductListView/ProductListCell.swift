//
//  ProductListCell.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: Product
    @EnvironmentObject var fav: Favorite
    @StateObject var userViewModel = UserViewModel()
    @State private var showingAlert = false
    @State private var favClicked = false
    
    var body: some View {
        
        VStack{
           
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
        
        }.alert("Please create an account before this action", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
        .overlay(
            Button{
                if !userViewModel.user.firstName.isEmpty{
                    fav.add(product)
                    favClicked = true
                }
                else {
                    showingAlert = true
                }
                
            } label: {
                FavBtn()
            },
            alignment: .topTrailing
        )
        .onAppear{
            userViewModel.retrievUser()
        }
    }
}

#Preview {
    ProductListCell(product: MockData.sampleProduct)
}
