//
//  UIColor.swift
//  myBaluchon
//
//  Created by Naji Achkar on 17/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import UIKit

extension UIColor {
    // Own colors created according to app logo colors
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    struct Custom {
        static  let myGreen = UIColor(red: 79, green: 134, blue: 149)
        static  let myRed = UIColor(red: 227, green: 102, blue: 97)
    }
}
