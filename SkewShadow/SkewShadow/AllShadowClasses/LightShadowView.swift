//
//  LightShadowView.swift
//
//  Created by Mamta Sharma on 12/6/20.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import UIKit

let errorLabelColor = UIColor(red: 241.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0)
let backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1)
let themeColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)

enum BlurLightViewCase {
    case normal, active, error
}

class BlurLightView: UIView {
    var backgroundState: BlurLightViewCase = .normal {
        didSet {
            switch backgroundState {
            case .normal:
                self.layer.sublayers?[0].backgroundColor = backgroundColor?.cgColor
               self.layer.sublayers?[0].borderColor = UIColor.clear.cgColor
               self.layer.sublayers?[0].borderWidth = 0.0
            case .active:
               self.layer.sublayers?[0].backgroundColor = UIColor.white.cgColor
                self.layer.sublayers?[0].borderColor = UIColor.clear.cgColor
                 self.layer.sublayers?[0].borderWidth = 0.0
            case .error:
                self.layer.sublayers?[0].backgroundColor = backgroundColor?.cgColor
                 self.layer.sublayers?[0].borderColor = errorLabelColor.cgColor
                  self.layer.sublayers?[0].borderWidth = 1.0
            }
        }
    }
}

extension UIView {
  
    func addSoftUIEffectForView(cornerRadius: CGFloat = 6.0,
                                themeColor: UIColor = UIColor(red: 245/255, green: 245/255,
                                                              blue: 245/255, alpha: 1.0)) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize( width: 5, height: 5)
        self.layer.shadowColor = UIColor(red: 0/255,
                                         green: 0/255,
                                         blue: 0/255,
                                         alpha: 0.05).cgColor

        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.backgroundColor = themeColor.cgColor
        shadowLayer.shadowColor =  UIColor(red: 255/255,
                                           green: 255/255,
                                           blue: 255/255, alpha: 0.8).cgColor
        shadowLayer.cornerRadius = cornerRadius
        shadowLayer.shadowOffset = CGSize(width: -5.0, height: -5.0)
        shadowLayer.shadowOpacity = 1.0
        shadowLayer.shadowRadius = 6
        self.layer.insertSublayer(shadowLayer, at: 0)
    }

    func removeShadow() {
        self.layer.sublayers?[0].removeFromSuperlayer()
    }
}
