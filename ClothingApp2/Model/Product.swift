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
    let imageURL:String
    let colour: String
    let size: String
    let category: String
    
}

struct ProductResponse: Decodable {
    let request: [Product]
}

struct MockData{
    static let sampleProduct = Product(
                                       id:1,
                                       name: "test",
                                       description: "test",
                                       price: 23.33,
                                       imageURL: "weew",
                                       colour: "test",
                                       size: "test",
                                       category: "test")
    
    
    static let products = [sampleProduct,sampleProduct,sampleProduct,sampleProduct]
    
    static let sampleProduct1 = Product(
                                       id:1,
                                       name: "test",
                                       description: "test",
                                       price: 23.33,
                                       imageURL: "weew",
                                       colour: "test",
                                       size: "test",
                                       category: "test")
    static let sampleProduct2 = Product(
                                       id:2,
                                       name: "test",
                                       description: "test",
                                       price: 23.33,
                                       imageURL: "weew",
                                       colour: "test",
                                       size: "test",
                                       category: "test")
    static let productsCart = [sampleProduct1,sampleProduct2]
}
