//
//  LogMealTableViewCell.swift
//  AutolayoutPractice
//
//  Created by Nogah Melamed Cohen on 28/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class LogMealTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    @IBOutlet weak var cellImege: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
