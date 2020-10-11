//
//  SpecialCondition.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct SpecialCondition: Decodable {
    let excludingConditions: [String]?
    let id: String?
    let isChecked: Bool?
    let language: Language?
    let name: String?
}
