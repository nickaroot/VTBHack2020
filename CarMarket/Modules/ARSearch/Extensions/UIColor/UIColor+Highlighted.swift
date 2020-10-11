//
//  UIColor+Highlighted.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

extension UIColor {
    open var highlighted: UIColor {
        guard let hue = hue,
              let saturation = saturation,
              var brightness = brightness,
              let alpha = alpha else { return self }
        
        let factor = CGFloat(0.098)
        
        brightness -= brightness > 0.5 ? factor : -factor
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    open var textHighlighted: UIColor {
        //        guard let hue = hue,
        //            let saturation = saturation,
        //            var brightness = brightness,
        //            let alpha = alpha else { return self }
        //
        //        let factor = CGFloat(1)
        //
        //        brightness += factor
        //
        //        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        guard let alpha = alpha else { return self }
        
        return self.withAlphaComponent(alpha - 0.8)
    }
}
