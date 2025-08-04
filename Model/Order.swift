//
//  Order.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 05/07/25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = [] // inject in in environment somewhere
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    
    
    
}

// View model is mostly bounded to a view
// but environment object can be accessed by various views
//
