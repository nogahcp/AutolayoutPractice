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
    
}

