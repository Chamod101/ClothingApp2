//
//  Order.swift
//  ClothingApp2
//
//  Created by NIBM-LAB04-PC05 on 2024-03-25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Product] = []{
        didSet {
            saveOrder()
        }
    }
    
    // UserDefaults key for storing favItems
      let orderKey = "ordersKey"
      
      init() {
          // Retrieve favorites from UserDefaults on initialization
          if let savedFavorites = UserDefaults.standard.array(forKey: orderKey) as? [[String: Any]] {
              items = decodeProducts(from: savedFavorites)
          }
      }
    
    // Function to save favorites to UserDefaults
       func saveOrder() {
           let encodedData = encodeProducts()
           UserDefaults.standard.set(encodedData, forKey: orderKey)
       }
    
    func retrieveOrder() {
           if let savedFavorites = UserDefaults.standard.array(forKey: orderKey) as? [[String: Any]] {
               items = decodeProducts(from: savedFavorites)
           }
       }
       
       // Function to encode Products
       private func encodeProducts() -> [[String: Any]] {
           return items.map { $0.toDictionary() }
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
        items.reduce(0) {$0 + $1.price}
    }
    
    func add(_ product: Product){
        items.append(product)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        saveOrder()
    }
}
