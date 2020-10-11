//
//  UIColor+Disabled.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

extension UIColor {
    open var disabled: UIColor {
        //        guard let brightness = brightness,
        //            let alpha = alpha else { return self }
        //
        //        return UIColor(hue: 0, saturation: 0, brightness: brightness, alpha: alpha)
        
        return .mainLightGray
    }
    
    open var textDisabled: UIColor {
        return .mainGray
    }
}
