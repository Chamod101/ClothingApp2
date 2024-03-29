//
//  CheckOutView.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-28.
//

import SwiftUI

struct CheckOutView: View {
    
    @EnvironmentObject var order: Order
    @Binding var checkOut : Bool
    @StateObject var userViewModel = UserViewModel()
    @State var orderComplete: Bool = false
    
    var body: some View {
        VStack{
            
            ScrollView{
                    
                VStack{
                    Text("Price Info")
                        .fontWeight(.medium)
                                           
                                       
                    HStack{
                        Text("Subtotal")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                     Text("$ \(order.totalPrice, specifier: "%.2f")")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                        }
                    
                    HStack{
                        Text("Delivery Fee")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                     Text(" - ")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                        }
                    
                    HStack{
                        Text("Tax")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                     Text(" - ")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                        }
                    Divider()
                    HStack{
                        Text("Total")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                        Text("$ \(order.totalPrice, specifier: "%.2f")")
                           .font(.system(size: 16, weight: .semibold))
                           .foregroundStyle(.gray)
                           .fontWeight(.light)
                           .padding(.vertical, 8)
                                              
                           }
                    Divider()
                    Divider()
                    
                }
                .padding()
                
                VStack{
                    Text("Delivery Info")
                       
                    HStack{
                        Text("Name")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                        Text("\(userViewModel.user.firstName)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                        }
                    
                    HStack{
                        Text("Email")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                        Text("\(userViewModel.user.email)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                        }
                    
                    HStack{
                        Text("Address")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.secondary)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                                           
                    Spacer()
                                           
                        Button(action: {}, label: {
                                               Image(systemName: "chevron.right")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 16, height: 16)
                                           })
                                           
                        }
                }.padding()
                
                VStack{
                    Text("Payment Info")
                    
                    HStack{
                        Text("Cash on delivery")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .fontWeight(.light)
                        .padding(.vertical, 8)
                        
                        
                                           
                    Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                        })
                      
                        }
                    
 HStack{
     Text("Visa / Master card")
         .font(.system(size: 16, weight: .semibold))
         .foregroundStyle(.gray)
         .fontWeight(.light)
         .padding(.vertical, 8)
     
     Spacer()
     
     Button(action: {}, label: {
         Image(systemName: "chevron.right")
             .resizable()
             .scaledToFit()
             .frame(width: 16, height: 16)
     })
 }
                }
                .padding()
                
            }
            Spacer()
            
            Button(action: {
               orderComplete = true
                   }, label: {
                   Text("Place Order")
                       .padding()
                       .padding(.horizontal)
                       .frame(width: 200, height: 30)
                       .background(Color(.color4))
                       .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                       .foregroundColor(.white)
                       .font(.system(size: 15, weight: .medium, design: .serif))
                   })
               .padding(.bottom, 25)
            
            
        }
        .onAppear{
            userViewModel.retrievUser()
        }
        .frame(width: 300, height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 40)
        .overlay(
            Button{
                checkOut = false
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
        .alert("Your order placed sucessfully!", isPresented: $orderComplete ) {
                           Button("OK", role: .cancel) {
                               checkOut = false
                               order.items.removeAll()
                           }
                       }
    }
}

#Preview {
    CheckOutView(checkOut: .constant(false))
}
