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
            NavigationStack{
                List(viewModel.products){product in
                    ProductListCell(product: product)
                }
                    .navigationTitle("Explore")
            }
            .onAppear{
                viewModel.getProducts()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
            
            
        }
    
    
  
}

#Preview {
    ExploreView(isDark: .constant(false))
}
