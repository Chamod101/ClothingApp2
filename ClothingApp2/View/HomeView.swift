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
                            Image(systemName: isDark ? "moon.stars.circle": "cloud.sun.circle")
                                .font(.system(size: 50))
                                .foregroundColor(isDark ?.white : .black)
                        })

                       
                    }.padding()
                    
                }
                .padding()
                
                ScrollView{
                    ScrollView(.horizontal){
                        HStack{
                            HomeCardView()
                            HomeCardView()
                            HomeCardView()
                            HomeCardView()
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
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(minWidth: 150,maxWidth: 150, minHeight: 200)
    }
}
