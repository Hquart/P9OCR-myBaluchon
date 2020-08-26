//
//  UIButton.swift
//  myBaluchon
//
//  Created by Naji Achkar on 18/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import UIKit

extension UIButton {
    // Func used to round buttons
    func setEdgesInset(value: Int) {
          self.contentEdgeInsets = UIEdgeInsets(top: CGFloat(value), left: CGFloat(value), bottom: CGFloat(value), right: CGFloat(value))
      }
}



