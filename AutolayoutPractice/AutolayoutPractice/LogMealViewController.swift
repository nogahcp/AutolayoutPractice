//
//  LogMealViewController.swift
//  AutolayoutPractice
//
//  Created by Nogah Melamed Cohen on 28/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class LogMealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        //self.foodTableView.register(LogMealTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Do any additional setup after loading the view.
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self
        self.createFoodItems()
    }
    
    @IBOutlet weak var foodTableView: UITableView!
    var foodItems: [FoodItem] = []
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    
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
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodItems.count
    }
    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell: LogMealTableViewCell = (self.foodTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! LogMealTableViewCell?)!
        let foodItem = self.foodItems[indexPath.row]
        
        // set the cell details from the data model
        cell.cellImege?.image = foodItem.picture
        cell.cellTitle?.text = foodItem.name
        cell.cellDescription?.text = foodItem.description

        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    

    // Set the spacing between sections
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellSpacingHeight
//    }

}
