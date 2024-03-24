//
//  ProductListViewModel.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import SwiftUI

public class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetails = false
    @Published var selectedProduct: Product?
    @State var uniqueCategories: Set<String> = Set()
    
    func getProducts(){
        isLoading = true
        NetworkManager.shared.getProducts{ [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let products):
                    self.products = products
                    
                case .failure(let error):
                    switch error{
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidDatea
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
    
    func getUniqueCategories(from products: [Product]) -> Set<String> {
        var uniqueCategories: Set<String> = Set()
        for product in products {
            uniqueCategories.insert(product.category)
        }
        return uniqueCategories
    }
}
