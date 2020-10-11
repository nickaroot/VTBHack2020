//
//  CarBrand.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CarBrand: Decodable {
    let absentee: Bool?
    let alias: String?
    let country: Country?
    let currentCarCount: Int?
    let currentModelsTotal: Int?
    let generations: [String]?
    let id: Int?
    let isOutbound: Bool?
    let logo: String?
    let models: [CarModel]?
    let title: String?
    let titleRus: String?
}
