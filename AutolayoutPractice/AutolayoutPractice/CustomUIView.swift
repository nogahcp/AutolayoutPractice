//
//  CustomUIView.swift
//  AutolayoutPractice
//
//  Created by Nogah Melamed Cohen on 28/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class CustomUIView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    //corners radius
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    //shadow
    @IBInspectable var shadowColor: CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) {
        didSet {
            self.layer.shadowColor = shadowColor
            self.addShadow()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
            self.addShadow()
        }
    }
    //add params
    
    private func addShadow() {
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    //border
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0) {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    //create dashed line
    @IBInspectable var dashedBorder: Bool = false {
        didSet {
            if self.dashedBorder {
                //from https://stackoverflow.com/a/48295270
                //Create a CAShapeLayer
                let shapeLayer = CAShapeLayer()
                shapeLayer.strokeColor = self.borderColor.cgColor
                shapeLayer.lineWidth = 1
                // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
                shapeLayer.lineDashPattern = [5,3]
                
                let path = CGMutablePath()
                path.addLines(between: [CGPoint(x: 0, y: 0),
                                        CGPoint(x: self.frame.width, y: 0)])
                shapeLayer.path = path
                self.layer.addSublayer(shapeLayer)
            }
            
            
        }
    }
}
