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
        self.iconeImageView.image = UIImage(named: "reservoir")
        self.buttonUnderlineText()
        
        //Looks for single or multiple taps to remove keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBOutlet weak var iconeImageView: UIImageView!
    @IBOutlet weak var carbsAbove300Label: UILabel!
    @IBOutlet weak var carbsAmountTextField: UITextField!
    //represent last input of carbs
    var carbsInput = 0
    @IBOutlet weak var showInsulinAmountButton: UIButton!
    
    @IBAction func carbsInputChanged(_ sender: UITextField) {
        //convert string to number
        if let carbs = Int(sender.text ?? "") {
            self.carbsInput = carbs
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
            //if entered a non number input - ignore
            sender.text = (self.carbsInput == 0 || sender.text!.isEmpty)  ? "" : String(self.carbsInput)
            //update carbsInput
            self.carbsInput = Int(sender.text ?? "") ?? 0
        }
    }
    
    private func buttonUnderlineText() {
        let font = self.showInsulinAmountButton.titleLabel?.font
        // from: https://stackoverflow.com/a/31359103
        let attrs = [ NSAttributedString.Key.underlineStyle : 1,
                      NSAttributedString.Key.font : font ?? UIFont.init(),
                      NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.462745098, green: 0.4745098039, blue: 0.631372549, alpha: 1),
                      NSAttributedString.Key.underlineColor : #colorLiteral(red: 0.462745098, green: 0.4745098039, blue: 0.631372549, alpha: 1)
            ] as [NSAttributedString.Key : Any]
        let attributedString = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string:"Show insulin amount", attributes:attrs)
        attributedString.append(buttonTitleStr)
        self.showInsulinAmountButton.setAttributedTitle(attributedString, for: .normal)
        
    }

    
    
}

