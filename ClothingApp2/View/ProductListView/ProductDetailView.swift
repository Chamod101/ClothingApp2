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
                
                VStack{
                    HStack{
                        Button(action: {
                            qty+=1
                        }, label: {
                            Text("+")
                        })
                        .frame(width: 20, height: 20)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .padding()
                        
                        
                        Text("\(qty)")
                        
                        
                        Button(action: {
                           
                            qty-=1
                        }, label: {
                            Text("-")
                        })
                        .disabled(qty<=1)
                        .frame(width: 20, height: 20)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .padding()
                    }
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
