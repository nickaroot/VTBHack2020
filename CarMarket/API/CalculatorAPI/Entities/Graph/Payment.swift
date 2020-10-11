//
//  Payment.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct Payment: Decodable {
    let balanceOut: Int?
    let debt: Int?
    let order: Int?
    let payment: Int?
    let percent: Int?
}
