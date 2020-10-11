//
//  SwiftMessages+BottomFailure.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import SwiftMessages

public extension SwiftMessages {
    class var bottomFailureConfig: Config {
        var config = SwiftMessages.defaultConfig
        
        config.preferredStatusBarStyle = .lightContent
        config.presentationStyle = .bottom
        
        return config
    }
    
    class func showBottomFailure(_ content: Content, isHideOnTapEnabled: Bool = true,
                                 isAutoHide: Bool = true, buttonTapHandler: ((_ button: UIButton?) -> Void)? = nil) {
        var config = SwiftMessages.bottomFailureConfig
        
        if !isAutoHide {
            config.duration = .forever
        }
        
        show(config: config) {
            let warning = MessageView.viewFromNib(layout: .cardView)
            
            warning.configureTheme(backgroundColor: UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1), foregroundColor: .white)
            warning.configureDropShadow()
            warning.configureContent(content)
            
            warning.buttonTapHandler = { _ in
                hide(id: warning.id)
                
                buttonTapHandler?(warning.button)
            }
            
            if isHideOnTapEnabled {
                warning.tapHandler = { _ in
                    hide(id: warning.id)
                }
            }
            
            return warning
        }
    }
}
