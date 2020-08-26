//
//  UIStackView.swift
//  myBaluchon
//
//  Created by Naji Achkar on 17/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
