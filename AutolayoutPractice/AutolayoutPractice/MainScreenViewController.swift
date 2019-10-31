//
//  MainScreenViewController.swift
//  AutolayoutPractice
//
//  Created by  temp on 31/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Carb Count":
            return
        case "Log Meal":
            return
        default:
            return
        }
    }
    

}
