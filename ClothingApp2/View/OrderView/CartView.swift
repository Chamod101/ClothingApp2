//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    @Binding var isDark : Bool
    @Binding var name: String
    
    @State var showCheckout : Bool = false
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){product in
                            CartListCell(product: product)
                            
                        }
                        .onDelete(perform: order.deleteItems)
                                    
                    }
                    .listStyle(PlainListStyle())
                    
                
                    Button{
                        showCheckout = true
                    } label: {
                        ProductBtn(title: "$\(order.totalPrice, specifier: "%.2f") - Confirm order")
                    }
                    .padding(.bottom, 25)
                }
                if userViewModel.user.firstName.isEmpty{
                   LoginState()
                    
                }
                else
                    if order.items.isEmpty {
                        EmptyState(imageName: "emptyCart", lable: "You have no items in your cart")
                    }
                
                
                
                
            }
            
            .onAppear{
                userViewModel.retrievUser()
            }
            .navigationTitle("Cart")
        }
        
        
        
        
        
        
        
    }
    
    
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
