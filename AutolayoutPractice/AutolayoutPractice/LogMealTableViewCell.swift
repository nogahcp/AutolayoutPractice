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
        //cell shadow
        self.createShadow()
        //cell radius
        self.createRoundEdges()
    }

    private func createShadow() {
        layer.masksToBounds = false
        layer.shadowColor = #colorLiteral(red: 0.462745098, green: 0.4745098039, blue: 0.631372549, alpha: 0.05).cgColor
        layer.shadowOpacity = 5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func createRoundEdges() {
        self.layer.cornerRadius = 4
        self.cellImege.layer.cornerRadius = 4
    }
    
    @IBOutlet weak var cellImege: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
