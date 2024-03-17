//
//  ContentView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct NavigationView: View {
    
    @State var selectedTab: Int = 0
    @State var isDark : Bool = false
    
    
    var body: some View {
        
        TabView(){
            
            HomeView(isDark: $isDark)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            FavoriteView(isDark: $isDark)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
                .tag(1)
            
            CartView(isDark: $isDark)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(2)
            
            ProfileView(isDark: $isDark)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(isDark ? .white : .black)

        
    }
}

#Preview {
    NavigationView()
}
