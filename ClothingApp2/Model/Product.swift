//
//  Product.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-18.
//

import Foundation

struct Product: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ProductResponse: Decodable {
    let request: [Product]
}

struct MockData{
    static let sampleProduct = Product(id: 0001,
                                       name: "Test Appetizer",
                                        description: "This is the description for my appetizer. It's yummy.",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let products = [sampleProduct,sampleProduct,sampleProduct,sampleProduct]
}
