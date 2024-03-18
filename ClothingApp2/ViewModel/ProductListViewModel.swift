//
//  ProductListViewModel.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import SwiftUI

final class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func getProducts(){
        NetworkManager.shared.getProducts{ result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
