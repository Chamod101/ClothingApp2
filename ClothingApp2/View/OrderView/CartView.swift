//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
    @Binding var isDark : Bool
    @Binding var name: String
    
    var body: some View {
        
        ZStack{
            if(name == ""){
                LoginNotificationView(bodyText: "Please creare an account before view the cart")
            }
        }
        
    }
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
