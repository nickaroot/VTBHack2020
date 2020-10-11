//
//  RFTextAttributes+Disabled.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

public extension RFTextAttributes {
    var disabled: RFTextAttributes {
        var attributes = self
        
        if let color = attributes.color {
            attributes.color = color.textDisabled
        }
        
        return attributes
    }
}
