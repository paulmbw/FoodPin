//
//  UIColourExtension.swift
//  FoodPin
//
//  Created by Paul Waweru on 29/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

/**
 This is used when we want to enxtend an exisiting class to provide further functionality. In this case,
 we want to extend UIColor to calcualte the correct RGB values (dividing by 255).
 */
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255
        let greenValue = CGFloat(green) / 255
        let blueValue = CGFloat(blue) / 255
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 10)
    }
}
