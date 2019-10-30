//
//  FoodItem.swift
//  AutolayoutPractice
//
//  Created by  temp on 30/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import Foundation
import UIKit

struct FoodItem: Equatable {

    var name: String = ""
    var description: String = ""
    var picture: UIImage? = nil
    var itemId: Int
    static var ID = 0
    
    init(name: String, description: String, picture: UIImage?) {
        self.name = name
        self.description = description
        self.picture = picture
        self.itemId = FoodItem.ID
        FoodItem.ID += 1
    }
    
    static func == (lhs: FoodItem, rhs: FoodItem) -> Bool {
        return lhs.itemId == rhs.itemId
    }
}
