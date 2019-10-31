//
//  LogMealViewController.swift
//  AutolayoutPractice
//
//  Created by Nogah Melamed Cohen on 28/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class LogMealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        //self.foodTableView.register(LogMealTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Do any additional setup after loading the view.
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self
        self.searchBar.delegate = self

        self.createFoodItems()
        self.setSaveButtonView()
        
        //Looks for single or multiple taps to remove keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.foodItems = searchText.isEmpty ? self.allFoodItemsItems : self.foodItems.filter { (item: FoodItem) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        self.foodTableView.reloadData()
    }
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBOutlet weak var saveButton: UIButton!
    private func setSaveButtonView() {
        //set gradient color
        let gradient = CAGradientLayer()
        gradient.frame = self.saveButton.bounds
        gradient.colors = [#colorLiteral(red: 1, green: 0.4, blue: 0.4705882353, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.6039215686, blue: 0.2274509804, alpha: 1).cgColor]
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5);
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5);
        self.saveButton.layer.addSublayer(gradient)
        //set rounded corner
        self.saveButton.layer.cornerRadius = 20 //not as in design
        self.saveButton.clipsToBounds = true
    }
    
    @IBOutlet weak var foodTableView: UITableView!
    var allFoodItemsItems: [FoodItem] = [] //all food items
    var foodItems: [FoodItem] = [] //food items need to display
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    var selectedFoodItems: [FoodItem] = []
    @IBOutlet weak var numberOfItemsSelectedLabel: UILabel!
    
    //insert food items to list
    private func createFoodItems() {
        var fi = FoodItem(name: "Coffee", description: "Aroma", picture: UIImage(named: "coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Sweetened Coffee With Milk", description: "", picture: UIImage(named: "cappuccino"))
        foodItems.append(fi)
        fi = FoodItem(name: "Breakfast Blend Coffee", description: "", picture: UIImage(named: "coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Iced Coffee With Milk", description: "", picture: UIImage(named: "iced coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Coffee", description: "", picture: UIImage(named: "instant coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Decaf Coffee", description: "", picture: UIImage(named: "instant coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Iced Mocha Coffee", description: "", picture: UIImage(named: "iced coffee"))
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        fi = FoodItem(name: "Instant Powder Coffee", description: "", picture: nil)
        foodItems.append(fi)
        
        self.allFoodItemsItems = foodItems.map { $0 }
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //extra cells for space between cells
        return (self.foodItems.count*2 - 1)
        //return self.foodItems.count
    }
    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if even number - "real" cell
        if indexPath.row%2 == 0 {
            // create a new cell if needed or reuse an old one
            let cell: LogMealTableViewCell = (self.foodTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! LogMealTableViewCell?)!
            let foodItem = self.foodItems[indexPath.row/2]
            
            // set the cell details from the data model
            cell.cellImege?.image = foodItem.picture
            cell.cellTitle?.text = foodItem.name
            cell.cellDescription?.text = foodItem.description
            return cell
        }
        //if not even - empty cell for space
        else {
            // create a "space" cell
            let cell: UITableViewCell = self.foodTableView.dequeueReusableCell(withIdentifier: "space")!
            return cell
        }
    
    }

    // when item selected - add/reduce from selected list
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if row is not even - a space row - dont select
        guard indexPath.row % 2 == 0 else {
            return
        }
        let indexForItem = indexPath.row / 2
        let item = self.foodItems[indexForItem]
        var added = true
        //add to list
        if !self.selectedFoodItems.contains(item) {
            self.selectedFoodItems.append(item)
        }
        //remove from list (if exist in list)
        else {
            self.selectedFoodItems.remove(at: (self.selectedFoodItems.firstIndex(of: item))!)
            added = false
        }
        //update label of item selected
        self.numberOfItemsSelectedLabel.text = "\(self.selectedFoodItems.count) items selected"
    }
    
    //return the cell hight according to index
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //if index is even - regular cell
        if indexPath.row % 2 == 0 {
            return 70
        }
        //index is not even - space cell
        else {
            return 6
        }
    }
    

}
