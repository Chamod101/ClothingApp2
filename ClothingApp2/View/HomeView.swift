//
//  HomeView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isDark : Bool
    
    var body: some View {
        
        ZStack{
            if(isDark){
                Color.black
                    .ignoresSafeArea()
            }else{
                Color.white
                    .ignoresSafeArea()
            }
            
            VStack{
                
                HStack{
                    VStack{
                        Text("Beauty comes")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(isDark ? .white : .black)
                        Text("When")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.pink.opacity(0.80))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Fashion Succeeds")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(isDark ? .white : .black)
                        
                    }.padding()
                    
                    VStack{
                        Button(action: {
                            isDark = !isDark
                        }, label: {
                            Image(systemName: isDark ? "moon.stars.circle": "sun.max.circle")
                                .font(.system(size: 50))
                                .foregroundColor(isDark ?.white : .black)
                        })

                       
                    }.padding()
                    
                }
                .padding()
                
                ScrollView{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            HomeCardView(
                                categoryName: "Trousers",
                                categoryImage: "DenimBackground")
                            HomeCardView(
                                categoryName: "Shirts",
                                categoryImage: "DenimBackground")
                            HomeCardView(
                                categoryName: "Blouse",
                                categoryImage: "DenimBackground")
                            HomeCardView(
                                categoryName: "Saree",
                                categoryImage: "DenimBackground")
                            HomeCardView(
                                categoryName: "Sports",
                                categoryImage: "DenimBackground")
                 
                           
                        }
                    }
                    .padding()
                    
                    
                }
                
            
                
                
            }
            
        }
    }
}

#Preview {
    HomeView(isDark: .constant(false))
}


struct HomeCardView: View {
    
    var categoryName: String
    var categoryImage: String
    
    var body: some View {
        
                ZStack(){
                    
                    Image(categoryImage)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 150,height: 70)
                        .scaledToFit()
                        .opacity(0.8)
                        
                    
                    Text("\(categoryName)")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                }
            }
    
}
