//
//  UIColor.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

public extension UIColor {
    /// RGBA(0...255, 0...255, 0...255, 0...1)
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.init(displayP3Red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    /// RGBA(238, 64, 84, 1)
    
    class var mainTintLight: UIColor {
        UIColor(238, 64, 84, 1)
    }
    
    /// RGBA(238, 64, 84, 0...1)
    
    class func mainTintLight(alpha: CGFloat) -> UIColor {
        Self.mainTintLight.withAlphaComponent(alpha)
    }
    
    /// RGBA(213, 57, 75, 1)
    
    class var mainTintDark: UIColor {
        UIColor(213, 57, 75, 1)
    }
    
    /// RGBA(213, 57, 75, 0...1)
    
    class func mainTintDark(alpha: CGFloat) -> UIColor {
        Self.mainTintDark.withAlphaComponent(alpha)
    }
    
    /// RGBA(254, 254, 254, 1)
    
    class var mainLight: UIColor {
        UIColor(254, 254, 254, 1)
    }
    
    /// RGBA(254, 254, 254, 0...1)
    
    class func mainLight(alpha: CGFloat) -> UIColor {
        Self.mainLight.withAlphaComponent(alpha)
    }
    
    /// RGBA(35, 37, 58, 1)
    
    class var mainDark: UIColor {
        UIColor(35, 37, 58, 1)
    }
    
    /// RGBA(35, 37, 58, 0...1)
    
    class func mainDark(alpha: CGFloat) -> UIColor {
        Self.mainDark.withAlphaComponent(alpha)
    }
    
    /// RGBA(242, 242, 242, 1)
    
    class var mainBorderLight: UIColor {
        UIColor(242, 242, 242, 1)
    }
    
    /// RGBA(242, 242, 242, 0...1)
    
    class func mainBorderLight(alpha: CGFloat) -> UIColor {
        Self.mainBorderLight.withAlphaComponent(alpha)
    }
    
    /// RGBA(235, 235, 235, 1)
    
    class var mainLightGray: UIColor {
        UIColor(235, 235, 235, 1)
    }
    
    /// RGBA(235, 235, 235, 0...1)
    
    class func mainLightGray(alpha: CGFloat) -> UIColor {
        Self.mainLightGray.withAlphaComponent(alpha)
    }
    
    /// RGBA(190, 190, 190, 1)
    
    class var mainGray: UIColor {
        UIColor(190, 190, 190, 1)
    }
    
    /// RGBA(190, 190, 190, 0...1)
    
    class func mainGray(alpha: CGFloat) -> UIColor {
        Self.mainGray.withAlphaComponent(alpha)
    }
    
    /// RGBA(82, 84, 108, 1)
    
    class var mainDarkGray: UIColor {
        UIColor(82, 84, 108, 1)
    }
    
    /// RGBA(82, 84, 108, 0...1)
    
    class func mainDarkGray(alpha: CGFloat) -> UIColor {
        Self.mainDarkGray.withAlphaComponent(alpha)
    }
    
    /// RGBA(153, 200, 53, 1)
    
    class var mainLightGreen: UIColor {
        UIColor(153, 200, 53, 1)
    }
    
    /// RGBA(153, 200, 53, 0...1)
    
    class func mainLightGreen(alpha: CGFloat) -> UIColor {
        Self.mainLightGreen.withAlphaComponent(alpha)
    }
}
