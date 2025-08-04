//
//  Appetizer.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 29/06/25.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Ghee Masala Mysore Dosa",
        description: "This is the description of my appetizer. It's yummy.",
        price: 9.90,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(
        id: 0002,
        name: "Ghee Masala Mysore Dosa",
        description: "This is the description of my appetizer. It's yummy.",
        price: 9.90,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let orderItemTwo = Appetizer(
        id: 0002,
        name: "Ghee Masala Dosa",
        description: "This is the description of my appetizer. It's yummy.",
        price: 9.90,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let orderItemThree = Appetizer(
        id: 0003,
        name: "Masala Mysore Dosa",
        description: "This is the description of my appetizer. It's yummy.",
        price: 9.90,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let sampleOrderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
