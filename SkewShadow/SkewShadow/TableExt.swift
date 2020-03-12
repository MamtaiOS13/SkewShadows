//
//  TableExt.swift
//  SkewShadow
//
//   Created by Mamta Sharma on 12/6/20.
//  Copyright © 2020 Mamta. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {

    static var NibName: String {
        return String(describing: self)
    }

    static func viewFromNib() -> UIView? {
        let sliderView = Bundle.main.loadNibNamed(NibName, owner: self, options: nil)![0] as? UIView
        return sliderView
    }
}

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {

    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func register(reuseIdentifier: String) {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

}
