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
                    .disabled(showCheckout)
                
                    Button{
                        showCheckout = true
                    } label: {
                        ProductBtn(title: "$\(order.totalPrice, specifier: "%.2f") - Checkout")
                    }
                    .padding(.bottom, 25)
                    .disabled(showCheckout)
                }
                if userViewModel.user.firstName.isEmpty{
                   LoginState()
                    
                }
                else
                    if order.items.isEmpty {
                        EmptyState(imageName: "cart image", lable: "You have no items in your cart")
                    }
                
                if showCheckout {
                    CheckOutView(checkOut: $showCheckout)
                }
                
                
            }
            
            .onAppear{
                userViewModel.retrievUser()
                order.retrieveOrder()
            }
            .navigationTitle("Cart")
        }
        
        
        
        
        
        
        
    }
    
    
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
