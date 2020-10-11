//
//  SettingsResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct SettingsResponse: Decodable {
    let anchor: String?
    let clientTypes: [String]?
    let cost: Decimal?
    let initialFee: Decimal?
    let kaskoDefaultValue: Int?
    let language: Language?
    let name: String?
    let openInNewTab: Bool?
    let programs: [String]?
    let specialConditions: [SpecialCondition]?
}
