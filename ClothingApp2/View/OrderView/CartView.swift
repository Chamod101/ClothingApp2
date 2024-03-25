//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
    @Binding var isDark : Bool
    @Binding var name: String
    @State private var orderItem = MockData.productsCart
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(orderItem){product in
                            CartListCell(product: product)
                            
                        }.onDelete(perform: { indexSet in
                            orderItem.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                
                    Button{
                        
                    } label: {
                        ProductBtn(title: "Place order")
                    }
                    .padding(.bottom, 25)
                }
                
                if orderItem.isEmpty {
                    EmptyState(imageName: "PlaceHolder", lable: "You have no items in your cart")
                }
            }
            
            .navigationTitle("Cart")
        }
        
        
    }
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
