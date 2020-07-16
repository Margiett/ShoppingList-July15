//
//  Category .swift
//  Diffable Data Source - Multiple Sections July 15
//
//  Created by Margiett Gil on 7/15/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

//MARK: First step create a enum

enum Category: String, CaseIterable {
    //CaseIterable: allows you to run all the keys into an array, you can use your keys as a for loop or dictornary you can look thru all  the category
    
    case running = "Running"
    case technology = "Technology"
    case education = "Education"
    case health = "health"
    case household = "household"
    case triathlon = "Triathlon"
    case shoppingCart = "Cart"
    
    
}
