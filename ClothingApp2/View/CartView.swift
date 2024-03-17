//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
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
        }
        
    }
}

#Preview {
    CartView(isDark: .constant(false))
}
