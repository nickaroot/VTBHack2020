//
//  UIColor+Rounded.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

public extension UIFont {
    class func roundedFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        if #available(iOS 13.0, *),
           let descriptor = UIFont.systemFont(ofSize: fontSize, weight: weight).fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: fontSize)
        } else {
            return UIFont.systemFont(ofSize: fontSize, weight: weight)
        }
    }
}
