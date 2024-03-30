//
//  FavoriteView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var isDark : Bool
    @StateObject var userViewModel = UserViewModel()
    
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
                    
                  
                }
                
                if userViewModel.user.firstName.isEmpty{
                   LoginState()
                    
                }
                else if fav.favItems.isEmpty{
                    EmptyState(imageName: "favorite image", lable: "You have no favorite items yet")
                }
            }
            .onAppear{
                userViewModel.retrievUser()
                fav.retrieveFavorites()
            }
            .navigationTitle("Favorite")
        }
        
    }
}

#Preview {
    FavoriteView(isDark: .constant(false))
}
