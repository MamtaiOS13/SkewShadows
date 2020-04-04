//
//  LightShadowButtons.swift
//
//  Created by Mamta Sharma on 12/6/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class LightShadowBtn: UIButton {
   override open var isHighlighted: Bool {
       didSet {
           if isHighlighted {
               setState()
           } else {
               resetState()
           }
       }
   }

   override open var isEnabled: Bool {
       didSet {
           if isEnabled == false {
               setState()
           } else {
               resetState()
           }
       }
   }

   func setState() {
       self.layer.shadowOffset = CGSize(width: -1, height: -1)
       self.layer.sublayers?[0].shadowOffset = CGSize(width: 1, height: 1)
        self.layer.sublayers?[1].isHidden = false
   }

   func resetState() {
       self.layer.shadowOffset = CGSize(width: 5, height: 5)
       self.layer.sublayers?[0].shadowOffset = CGSize(width: -5, height: -5)
       self.layer.sublayers?[1].isHidden = true
   }

    func addSoftUIEffectForButton(cornerRadius: CGFloat = 6.0,
                                  themeColor: UIColor =  UIColor(red: 245/255,
                                                                 green: 245/255,
                                                                 blue: 245/255, alpha: 1.0)) {
       self.layer.cornerRadius = cornerRadius
       self.layer.masksToBounds = false
       self.layer.shadowRadius = 5
       self.layer.shadowOpacity = 0.8
       self.layer.shadowOffset = CGSize( width: 5, height: 5)
       self.layer.shadowColor =  UIColor(red: 0/255,
                                               green: 0/255,
                                               blue: 0/255,
                                               alpha: 0.05).cgColor

       let shadowLayer = CAShapeLayer()
       shadowLayer.frame = bounds
       shadowLayer.backgroundColor = themeColor.cgColor
       shadowLayer.shadowColor = UIColor(red: 255/255,
       green: 255/255,
       blue: 255/255, alpha: 0.89).cgColor
       shadowLayer.cornerRadius = cornerRadius
       shadowLayer.shadowOffset = CGSize(width: -5.0, height: -5.0)
       shadowLayer.shadowOpacity = 0.8
       shadowLayer.shadowRadius = 6
       self.layer.insertSublayer(shadowLayer, below: self.imageView?.layer)

       let selectLayer = CAShapeLayer()
       selectLayer.frame = bounds
       selectLayer.backgroundColor =  UIColor(red: 0/255,
              green: 0/255,
              blue: 0/255,
              alpha: 0.03).cgColor
       selectLayer.shadowColor = UIColor(red: 0/255,
       green: 0/255,
       blue: 0/255,
       alpha: 0.03).cgColor
       selectLayer.cornerRadius = cornerRadius
       selectLayer.shadowOffset = CGSize(width: 0, height: 0)
       selectLayer.shadowOpacity = 0.8
       selectLayer.shadowRadius = 6

       self.layer.insertSublayer(selectLayer, above: shadowLayer)

       self.layer.sublayers?[1].isHidden = true
   }
}
