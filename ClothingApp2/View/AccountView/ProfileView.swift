//
//  ProfileView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct ProfileView: View {
    
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
    ProfileView(isDark: .constant(false))
}
