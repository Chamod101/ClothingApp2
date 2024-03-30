//
//  ProductDetailView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-22.
//

import SwiftUI



struct ProductDetailView: View {
    
    @State var alertItem: AlertItem?
    @EnvironmentObject var order: Order
    @StateObject var userViewModel = UserViewModel()
    @State private var showingAlert = false
    @State var qty : Int = 1
    
    var product: Product
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack{
            
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 270)
            
            ScrollView{
                VStack(alignment: .leading){
                    HStack {
                        Text(product.name)
                            .font(.system(size: 16, weight: .medium, design: .serif))
                            .fontWeight(.semibold)
                        
                        
                    }
                    .padding(.horizontal)
                   
                    
                    Text(product.description)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 13, weight: .light, design: .serif))
                        .padding()
                    
                }
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            ProductCountDetails(
                                title: "Colour",
                                value: product.colour)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, -10)
                        
                        VStack{
                            ProductCountDetails(
                                title: "Size",
                                value: product.size)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        ProductCountDetails(
                            title: "Category",
                            value: product.category)
                    }
                    .padding(.horizontal)
                    
                }
                
                
                .font(.system(size: 16, weight: .light, design: .serif))
                
                Spacer()
                
                HStack{
                    VStack{
                        HStack (spacing: 2) {
                                           ForEach(0..<5) { item in
                                               Image(systemName: "star.fill")
                                                   .foregroundColor(.yellow)
                                               }
                                           }
                        .padding(.horizontal)
                        
                    }.padding(.top ,10)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            Button(action: {
                                qty+=1
                            }, label: {
                                Text("+")
                            })
                            .frame(width: 30, height: 30)
                                                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                                            .foregroundColor(.gray)
                                        
                            
                            
                            Text("\(qty)")
                            
                            
                            Button(action: {
                               
                                qty-=1
                            }, label: {
                                Text("-")
                            })
                            .disabled(qty<=1)
                            .frame(width: 30, height: 30)
                                                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                                            .foregroundColor(.gray)
                                        
                        }
                }
                    .padding(.horizontal)
                }
                
                
                
            
            
            }
            Spacer()
            
            Button{
                
                if !userViewModel.user.firstName.isEmpty{
                    order.add(product)
                    isShowingDetails = false
                }
                else{
                    showingAlert = true
                }
                
            } label: {
                ProductBtn(title: "$\(product.price * Double(qty), specifier: "%.2f") - Add to Cart")
            }
            .padding(.bottom,30)
            .padding(.horizontal)
        }
        
        
        .frame(width: 300, height: 600)
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
        .alert("Please create an account before this action", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
        .onAppear{
            userViewModel.retrievUser()
        }
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
