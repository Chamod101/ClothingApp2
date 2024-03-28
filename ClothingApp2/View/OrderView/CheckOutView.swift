//
//  CheckOutView.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-28.
//

import SwiftUI

struct CheckOutView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            
            ScrollView{
                VStack{
                    Text("Checkout")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                VStack{
                    List{
                        ForEach(order.items){product in
                            Text(product.name)
                            
                        }
                        .onDelete(perform: order.deleteItems)
                                    
                    }
                    .listStyle(PlainListStyle())
                    
                }
                
                
            }
            Spacer()
            
            
        }
        .frame(width: 300, height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
        .overlay(
            Button{
                
                
            } label: {
                Text("Close")
            },
            alignment: .topTrailing
        )
    }
}

#Preview {
    CheckOutView()
}
