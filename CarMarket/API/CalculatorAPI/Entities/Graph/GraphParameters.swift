//
//  GraphParameters.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct GraphParameters: Encodable {
    let contractRate: Decimal
    let lastPayment: Decimal
    let loanAmount: Decimal
    let payment: Decimal
    let term: Int
    
    static var mocked: Self {
        Self(
            contractRate: 10.1,
            lastPayment: 38.41310278,
            loanAmount: 1000000,
            payment: 50000,
            term: 5
        )
    }
}
