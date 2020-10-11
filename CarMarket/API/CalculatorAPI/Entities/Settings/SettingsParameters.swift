//
//  SettingsParameters.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct SettingsParameters: Encodable {
    let name: String
    let language: String?
    
    static var mocked: Self {
        Self(
            name: "Haval",
            language: nil
        )
    }
}
