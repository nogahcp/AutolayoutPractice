//
//  FoodItem.swift
//  AutolayoutPractice
//
//  Created by  temp on 30/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import Foundation
import UIKit

struct FoodItem {
    var name: String = ""
    var description: String = ""
    var picture: UIImage? = nil
    
    init(name: String, description: String, picture: UIImage?) {
        self.name = name
        self.description = description
        self.picture = picture
    }
}
