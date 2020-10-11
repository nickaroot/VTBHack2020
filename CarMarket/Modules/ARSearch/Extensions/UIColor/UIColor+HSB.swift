//
//  UIColor+HSB.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

extension UIColor {
    open var hue: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(&value, saturation: nil, brightness: nil, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var saturation: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: &value, brightness: nil, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var brightness: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: nil, brightness: &value, alpha: nil)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
    
    open var alpha: CGFloat? {
        var value = CGFloat.leastNonzeroMagnitude
        
        getHue(nil, saturation: nil, brightness: nil, alpha: &value)
        
        return value != CGFloat.leastNonzeroMagnitude ? value : nil
    }
}
