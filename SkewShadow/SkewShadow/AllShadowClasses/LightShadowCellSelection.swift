//
//  LightShadowCellSelection.swift
//
//  Created by Mamta Sharma on 12/7/20.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import UIKit

class LightShadowCellSelection: BaseTableCell {
    @IBOutlet weak var shadowView: BlurLightView!
       override func awakeFromNib() {
           super.awakeFromNib()
           delay(delay: 0.1) {
               self.shadowView?.addSoftUIEffectForView()
           }
       }
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           super.touchesBegan(touches, with: event)
           self.shadowView.layer.sublayers?[1].isHidden = false
       }
       override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           super.touchesEnded(touches, with: event)
           delay(delay: 0.1) {
               self.shadowView.layer.sublayers?[1].isHidden = true
           }
       }
       override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
              super.touchesCancelled(touches, with: event)
           delay(delay: 0.1) {
                      self.shadowView.layer.sublayers?[1].isHidden = true
                 }
       }
}
// global method for delay
func delay(delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
