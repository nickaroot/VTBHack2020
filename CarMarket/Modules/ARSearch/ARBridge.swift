//
//  ARBridge.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit
import ARKit

class ARBridge {
    
    static let shared = ARBridge()
    
    var anchorsToIdentifiers = [ARAnchor : (String, Int?)]()
    
    var marketplace: Marketplace?
    
    init() {
        MarketplaceService.getMarketplace { [weak self] (marketplace, error) in
            guard error == nil, let marketplace = marketplace else { return }
            
            self?.marketplace = marketplace
        }
    }
}
