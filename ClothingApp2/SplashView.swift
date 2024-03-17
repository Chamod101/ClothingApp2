//
//  SplashView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if(isActive){
            ContentView()
        }
        else{
            VStack{
                ZStack{
                    Color(.black)
                        .ignoresSafeArea()
                    
                    VStack{
                        Image(systemName: "hare.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                        
                        Text("Shopy fly")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashView()
}
