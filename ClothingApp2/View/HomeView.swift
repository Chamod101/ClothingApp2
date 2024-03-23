//
//  HomeView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        
        ZStack{
            
            
            VStack{
                
                HStack{
                    VStack{
                        Text("Beauty comes")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        Text("When")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.pink.opacity(0.80))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Fashion Succeeds")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                    }.padding()
                    
                    
                }
                .padding()
                
                ScrollView{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 50, height: 50)
                            
                 
                        }
                    }
                    .padding()
                    
                    
                }
                
            
                
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}


