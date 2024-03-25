//
//  ExploreView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    @State private var searchTerm = ""
    @State private var isList: Bool = false
    @State private var isShowingDetails: Bool = false
    @State var selectedProduct: Product?
    @Binding var selectedCategory: String
    
    var filterdCategory:  [Product] {
        guard !selectedCategory.isEmpty else {return viewModel.products}
        return viewModel.products.filter{ $0.category.localizedCaseInsensitiveContains(selectedCategory) }
    }
    
    var filteredProducts: [Product] {
        guard !searchTerm.isEmpty else {return filterdCategory}
        return filterdCategory.filter{ $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }

    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    
    
    var body: some View {
        
        ZStack{
            
            NavigationStack{
//                List(viewModel.products){product in
//                    ProductListCell(product: product)
//                }
//                    .navigationTitle("Explore")
                
                
                if !(selectedCategory == ""){
                    HStack{
                        Text("Category - \(selectedCategory)")
                        Spacer()
                        Button(action: {
                            selectedCategory = ""
                        }, label: {
                            Text("Clear Filter")
                        })
                    }.padding()
                }
                
                ScrollView{
                    LazyVGrid(columns:columns){
                        ForEach(filteredProducts, id: \.id){product in
                                            ProductListCell(product: product)
                                .onTapGesture {
                                    viewModel.selectedProduct = product
                                    viewModel.isShowingDetails = true
                                }
                                        }
                                    }
                }
                .navigationTitle(selectedCategory == "" ? "Explore" : selectedCategory)
                .disabled(viewModel.isShowingDetails)
                
                
            }
            .searchable(text: $searchTerm, prompt: "Search product")
            .onAppear{
                viewModel.getProducts()
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isShowingDetails {
                ProductDetailView(product: viewModel.selectedProduct!, isShowingDetails: $viewModel.isShowingDetails)
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
    ExploreView(selectedProduct: MockData.sampleProduct, selectedCategory: .constant("sample"))
}
