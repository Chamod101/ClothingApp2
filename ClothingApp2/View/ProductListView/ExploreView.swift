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
    @State private var searchTerm = ""
    @State private var isList: Bool = false
    
    var filteredProducts: [Product] {
        guard !searchTerm.isEmpty else {return viewModel.products}
        return viewModel.products.filter{ $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }

    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible())]

    
    var body: some View {
        
        ZStack{
            
            NavigationStack{
//                List(viewModel.products){product in
//                    ProductListCell(product: product)
//                }
//                    .navigationTitle("Explore")
                
                ScrollView{
                    LazyVGrid(columns:columns){
                        ForEach(filteredProducts, id: \.id){product in
                                            ProductListCell(product: product)
                                        }
                                    }
                }
                .navigationTitle("Explore")
                
                
            }
            .searchable(text: $searchTerm, prompt: "Search product")
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
