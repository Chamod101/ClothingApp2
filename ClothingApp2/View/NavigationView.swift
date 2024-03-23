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
    @State var name: String = ""
    
    
    var body: some View {
        
        TabView(){
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            ExploreView(isDark: $isDark, selectedProduct: MockData.sampleProduct, category: "")
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Explore")
                }
                .tag(1)
            
            FavoriteView(isDark: $isDark)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
                .tag(2)
            
            CartView(isDark: $isDark, name: $name)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(3)
            
            ProfileView(name: $name)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(isDark ? .white : .black)

        
    }
}

#Preview {
    NavigationView()
}
