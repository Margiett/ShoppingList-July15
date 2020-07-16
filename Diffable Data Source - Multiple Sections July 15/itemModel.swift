//
//  itemModel.swift
//  Diffable Data Source - Multiple Sections July 15
//
//  Created by Margiett Gil on 7/15/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
// MARK: Second Step create a model

// UITableViewDiffableDataSource<Category, Item>

struct Item: Hashable {
    let name: String
    let price: Double
    let category: Category
    let identifier = UUID()
    
    // implement the hashable property for item
    // Hasher is the hash function in Swift
    
    // the inout means that the only thing you want to make unique is the identifier if you dont, use hashable it would make all the items in the model, hashable and creating the function it would only make what you add in the function hasable.
    
    // without this function it makes everything in the model hasbale . ****
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    //create test data
    
    static func testData() -> [Item] {
        return [
            Item(name: "Polar Buletooth", price: 0, category: .running),
            Item(name: "The Pragmatic Programmer", price: 42.35, category: .education),
            Item(name: "DonJoy Performance POD Ankle Brace", price: 55.66, category: .running),
            Item(name: "Cracking the Coding Interview", price: 26.99, category: .education),
            Item(name: "Tri shoes", price: 120.00, category: .triathlon),
            Item(name: "Tri suit", price: 240.00, category: .triathlon),
            Item(name: "Towel hooks", price: 50.00, category: .household),
            Item(name: "Beginner Microscope STEM Kit", price: 39.99, category: .education),
            Item(name: "Fitbit Versa 2", price: 199.95, category: .technology),
            Item(name: "BISSELL Cleanview Swivel Pet", price: 99.99, category: .household),
            Item(name: "Ninja Professional", price: 89.99, category: .household),
            Item(name: "Debrox Swimmer's Ear", price: 7.99, category: .health),
            Item(name: "Tylenol Extra Strength", price: 9.47, category: .health)
            
            
        ]
    }
    
    
    
}
