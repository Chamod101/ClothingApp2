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
            VStack{
                List{
                    ForEach(orderItem){product in
                        ProductListCell(product: product)
                        
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
            
            .navigationTitle("Cart")
        }
        
        
    }
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
