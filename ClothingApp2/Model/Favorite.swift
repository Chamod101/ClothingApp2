//
//  Favorite.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-27.
//

import SwiftUI

final class Favorite: ObservableObject {
    @Published var favItems: [Product] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    // UserDefaults key for storing favItems
      let favoritesKey = "favoritesKey"
      
      init() {
          // Retrieve favorites from UserDefaults on initialization
          if let savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [[String: Any]] {
              favItems = decodeProducts(from: savedFavorites)
          }
      }
    
    // Function to save favorites to UserDefaults
       func saveFavorites() {
           let encodedData = encodeProducts()
           UserDefaults.standard.set(encodedData, forKey: favoritesKey)
       }
    
    func retrieveFavorites() {
           if let savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [[String: Any]] {
               favItems = decodeProducts(from: savedFavorites)
           }
       }
       
       // Function to encode Products
       private func encodeProducts() -> [[String: Any]] {
           return favItems.map { $0.toDictionary() }
       }
    
    // Function to decode Products
        private func decodeProducts(from data: [[String: Any]]) -> [Product] {
            return data.compactMap { dict in
                guard let id = dict["id"] as? Int,
                      let name = dict["name"] as? String,
                      let description = dict["description"] as? String,
                      let price = dict["price"] as? Double,
                      let imageURL = dict["imageURL"] as? String,
                      let colour = dict["colour"] as? String,
                      let size = dict["size"] as? String,
                      let category = dict["category"] as? String
                else {
                    return MockData.sampleProduct
                }
                return Product(id: id, name: name, description: description, price: price, imageURL: imageURL, colour: colour, size: size, category: category)
            }
        }
  
    var totalPrice: Double {
        favItems.reduce(0) {$0 + $1.price}
    }
    
    func add(_ product: Product){
        favItems.append(product)
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        favItems.remove(atOffsets: offsets)
        saveFavorites()
    }
}

