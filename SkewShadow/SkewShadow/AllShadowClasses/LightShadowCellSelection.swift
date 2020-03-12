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
        self.shadowView?.addSoftUIEffectForView()
        
    }
}
