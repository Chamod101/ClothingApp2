//
//  FavoriteView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var isDark : Bool
    
    @EnvironmentObject var fav: Favorite

    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(fav.favItems){product in
                            CartListCell(product: product)
                            
                        }
                        .onDelete(perform: fav.deleteItems)
                                    
                    }
                    .listStyle(PlainListStyle())
                  
                }
                
                if fav.favItems.isEmpty{
                    EmptyState(imageName: "favIcon", lable: "You have no favorite items yet")
                }
            }
            
            .navigationTitle("Favorite")
        }
        
    }
}

#Preview {
    FavoriteView(isDark: .constant(false))
}
