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
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var snapshot = self.snapshot()
            if let item = itemIdentifier(for: indexPath) {
                snapshot.deleteItems([item])
                apply(snapshot, animatingDifferences: true )
            }
        }
    }
}
