//
//  BaseTableCell.swift

//
//  Created by Mamta Sharma on 12/6/20.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import UIKit

class BaseTableCell: UITableViewCell, NibLoadableView, ReusableView {
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
