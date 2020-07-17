//
//  ViewController.swift
//  Diffable Data Source - Multiple Sections July 15
//
//  Created by Margiett Gil on 7/15/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableview: UITableView!
    
    // creating an instance variable for our datasource
    private var dataSource: DataSource! // is the subclass we created
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        confirgureTableView()
        confirgureDataSource()
    }
    
    private func configureNavBar(){
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditState))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddVC))
    }
    
    // creating the tableview programtic
    private func confirgureTableView(){
        tableview = UITableView(frame: view.bounds, style: .insetGrouped)
        // setting up the constrains for tableview
        tableview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableview.backgroundColor = .systemGroupedBackground
        // creating the cell ,
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableview)
    }
    
    private func confirgureDataSource() {
        dataSource = DataSource(tableView: tableview, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            // we will start to configure our cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(item.name)"
            return cell
        })
        
        //MARK: setup type of animation
        dataSource.defaultRowAnimation = .fade
        
        // setting initial snapshot
        // this is to match your datasourcr type !!
        // if you was to put String instead of Category you would get a error
        var snapshot = NSDiffableDataSourceSnapshot<Category, Item>()
        
        // populate snapshot with sections and items for each section
        // using a for loop
        // CaseIterable allows us to iterate through all the cases of an enum
        for category in Category.allCases {
            // filter the testData() [items] function items for that particular category's items
            // getting all the test data and filtering it into category
            let items = Item.testData().filter { $0.category == category }
            // seprate it by sections
            // you have to append the sections first and than the items !!
            snapshot.appendSections([category]) // adding section to table view
            snapshot.appendItems(items)
            
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
    
   @objc private func toggleEditState(){
    // 1. false -> 2. true -> 3. false
    
    // 1. !isEditing = false - > true
    // 2. !isEditing = true -> false
    // 3. !isEditing = false -> true

/*
     if tableView.isEditing {
     navigationItem.leftBarbuttonItem
     */



    tableview.setEditing(!tableview.isEditing, animated: true)
                                            // if is true is going to be done if is not is going to say edit (barbuttonItem)
    navigationItem.leftBarButtonItem?.title = tableview.isEditing ? "Done" : "Edit"
        
    }
    @objc private func presentAddVC() {
        //TODO:
        // 1. create a AddItemViewController.swift file
        // this is using delegation 
        guard let addItemVC = storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as? AddItemViewController else {
            return
        }
        addItemVC.delegate = self
        present(addItemVC, animated: true)
        // 2. create a ViewController  object in storyboard
        // 3. add 2 textfields, one for the item name other for the price
        // 4. add a picker view to mange the categories
        // 5. user is able to add a new item, to given category and click on a submit button
        // 6. use any communication paradigm to get data from the AddItemViewController back to the ViewController
        //MARK: type of communication : delegate, KVO notification center, unwind segue, callbacks, combine
        // what are callbacks and combines ???????
// call backs we have not used ,
        // combines we have not used that much
    }
    
    
}

extension ViewController: AddItemViewControllerDelegate {
    func didAddNewItem(_ addItemViewController: AddItemViewController, item: Item) {
         var snapshot = dataSource.snapshot()
               snapshot.appendItems([item], toSection: item.category)
               dataSource.apply(snapshot, animatingDifferences: true)
    }
    
 
}

