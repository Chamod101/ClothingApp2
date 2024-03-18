//
//  ExploreView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ProductListViewModel()
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
            
            NavigationStack{
                List(viewModel.products){product in
                    ProductListCell(product: product)
                }
                    .navigationTitle("Explore")
            }
            .onAppear{
                viewModel.getProducts()
            }
            
        }
    }
    
  
}

#Preview {
    ExploreView(isDark: .constant(false))
}
