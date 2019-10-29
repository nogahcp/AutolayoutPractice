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
        self.foodTableView.register(LogMealTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Do any additional setup after loading the view.
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self

    }
    
    @IBOutlet weak var foodTableView: UITableView!
    var foodNames: [String] = ["apple", "bread"]
    var foodDescription: [String] = ["",""]
    var foodPicture: [UIImage?] = [nil,nil]
    let cellReuseIdentifier = "cell"

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodNames.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell: LogMealTableViewCell = (self.foodTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! LogMealTableViewCell?)!

        
        // set the text from the data model
        cell.textLabel?.text = self.foodNames[indexPath.row]
        
        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}
