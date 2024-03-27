//
//  Favorite.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-27.
//

import SwiftUI

final class Favorite: ObservableObject {
    @Published var favItems: [Product] = []
    
    var totalPrice: Double {
        favItems.reduce(0) {$0 + $1.price}
    }
    
    func add(_ product: Product){
        favItems.append(product)
    }
    
    func deleteItems(at offsets: IndexSet) {
        favItems.remove(atOffsets: offsets)
    }
}

