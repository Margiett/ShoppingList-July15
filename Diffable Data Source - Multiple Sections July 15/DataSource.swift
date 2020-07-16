//
//  DataSource.swift
//  Diffable Data Source - Multiple Sections July 15
//
//  Created by Margiett Gil on 7/15/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import UIKit

// conforms to UITableViewDataSource
class DataSource: UITableViewDiffableDataSource<Category, Item> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if Category.allCases[section] == .shoppingCart {
            // this is adding a shopping cart emoji in the sections of the tableview
            return "🛒" + Category.allCases[section].rawValue
        } else {
            // you have to do the category of allcasses this is subcription
            return Category.allCases[section].rawValue //"Running"
        }
    
    }
    
}
