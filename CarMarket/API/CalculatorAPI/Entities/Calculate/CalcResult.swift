//
//  CalcResult.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CalcResult: Decodable {
    let contractRate: Decimal?
    let kaskoCost: Int?
    let lastPayment: Decimal?
    let loanAmount: Decimal?
    let payment: Decimal?
    let subsidy: Decimal?
    let term: Int?
}
