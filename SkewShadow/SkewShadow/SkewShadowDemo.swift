//
//  SkewShadowDemo.swift
//  SkewShadow
//
//  Created by kiwiTech on 12/03/20.
//  Copyright © 2020 Mamta. All rights reserved.
//

import UIKit
import Foundation

class SkewShadowDemo: UIViewController {
 @IBOutlet weak var shadowView: BlurLightView!
@IBOutlet weak var shadowBtn: LightShadowBtn!
@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(SingleFieldCell.self)
        self.shadowView?.addSoftUIEffectForView()
        self.shadowBtn?.addSoftUIEffectForButton(cornerRadius: 6)
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        self.tableView?.rowHeight = UITableView.automaticDimension
    }
}

extension SkewShadowDemo: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = tableView.dequeueReusableCell(withIdentifier:
          SingleFieldCell.reuseIdentifier, for: indexPath) as? SingleFieldCell {
          return cell
      } else {
          return UITableViewCell()
      }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

