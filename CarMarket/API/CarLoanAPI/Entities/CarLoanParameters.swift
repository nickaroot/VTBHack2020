//
//  CarLoanParameters.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CarLoanParameters: Encodable {
    let comment: String
    let customer_party: CustomerParty
    let datetime: String
    let interest_rate: Decimal
    let requested_amount: Int
    let requested_term: Int
    let trade_mark: String
    let vehicle_cost: Int
    
    static var mocked: Self {
        Self(
            comment: "Комментарий",
            customer_party: CustomerParty(
                email: "apetrovich@example.com",
                income_amount: 140000,
                person: Person(
                    birth_date_time: "1981-11-01",
                    birth_place: "г. Воронеж",
                    family_name: "Иванов",
                    first_name: "Иван",
                    gender: .female,
                    middle_name: "Иванович",
                    nationality_country_code: "RU"
                ),
                phone: "+99999999999"
            ),
            datetime: "2020-10-10T08:15:47Z",
            interest_rate: 15.7,
            requested_amount: 300000,
            requested_term: 36,
            trade_mark: "Nissan",
            vehicle_cost: 600000
        )
    }
}
