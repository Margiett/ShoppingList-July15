//
//  AddItemViewControllerDelegate.swift
//  Diffable Data Source - Multiple Sections July 15
//
//  Created by Margiett Gil on 7/15/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
protocol AddItemViewControllerDelegate: AnyObject {
    func didAddNewItem(_ addItemViewController: AddItemViewController, item: Item)
}
class AddItemViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var priceTextField: UITextField!
    @IBOutlet private weak var pickerView: UIPickerView!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    private var selectedCategory: Category?
    private var didCreateItem: ((Item) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        selectedCategory = Category.allCases.first
    }
    
    @IBAction func didAddItemToShoppingList(){
        guard let name = nameTextField.text,
            !name.isEmpty,
            let priceText = priceTextField.text,
            !priceText.isEmpty,
        let price = Double(priceText),
            let selectedCategory = selectedCategory else {
                print("missing fields")
                return
        }
        let item = Item(name: name, price: price, category: selectedCategory)
        
        // using delegation
        delegate?.didAddNewItem(self, item: item)
        
        dismiss(animated: true)
    }
}

extension AddItemViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
}

extension AddItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return Category.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent: Int) {
        selectedCategory = Category.allCases[row]
    }
}
