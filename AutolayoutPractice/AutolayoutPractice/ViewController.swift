//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Nogah Melamed Cohen on 28/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.iconeImageView.image = UIImage(named: "Assets/icons/reservoir.png")
    }

    @IBOutlet weak var iconeImageView: UIImageView!
    @IBOutlet weak var carbsAbove300Label: UILabel!
    @IBOutlet weak var carbsAmountTextField: UITextField!
    
    @IBAction func carbsInputChanged(_ sender: UITextField) {
        //convert string to number
        if let carbs = Int(sender.text ?? "") {
            //alert if exceed 300
            if carbs > 300 {
                self.carbsAbove300Label.isHidden = false
            }
            else {
                self.carbsAbove300Label.isHidden = true
            }
        }
        else {
            self.carbsAbove300Label.isHidden = true
        }
    }

    
    
}

