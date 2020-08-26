//
//  UIView.swift
//  myBaluchon
//
//  Created by Naji Achkar on 12/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//


import UIKit

extension UIView {
    
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
}



