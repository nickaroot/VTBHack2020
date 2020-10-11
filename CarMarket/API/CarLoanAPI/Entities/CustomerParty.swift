//
//  CustomerParty.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CustomerParty: Encodable {
    let email: String
    let income_amount: Decimal
    let person: Person
    let phone: String
}
