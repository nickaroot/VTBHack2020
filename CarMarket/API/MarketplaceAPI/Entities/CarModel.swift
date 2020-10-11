//
//  CarModel.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CarModel: Decodable {
    let absentee: Bool?
    let alias: String?
    let bodies: [CarBody]?
    let brand: CarBrandOnly?
    let carId: String?
    let colorsCount: Int?
    let count: Int?
    let hasSpecialPrice: Bool?
    let id: Int?
    let metallicPay: Int?
    let minprice: Int?
    let model: CarModelModel?
    let ownTitle: String?
    let pearlPay: Int?
    let photo: String?
    let prefix: String?
    let premiumPriceSpecials: [String]?
//    let renderPhotos: [String: Any]? // FIXME: Model
    let sizesPhotos: [String: String]?
    let specmetallicPay: Int?
    let title: String?
    let titleRus: String?
    let transportType: TransportType?
}
