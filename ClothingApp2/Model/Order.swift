//
//  Order.swift
//  ClothingApp2
//
//  Created by NIBM-LAB04-PC05 on 2024-03-25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Product] = []
    
    func add(_ product: Product){
        items.append(product)
    }
}
