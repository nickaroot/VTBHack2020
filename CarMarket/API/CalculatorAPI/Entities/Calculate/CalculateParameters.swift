//
//  CalculateParameters.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CalculateParameters: Encodable {
    let clientTypes: [String]
    let cost: Decimal?
    let initialFee: Decimal?
    let kaskoValue: Int
    let language: Language
    let residualPayment: Decimal
    let settingsName: String
    let specialConditions: [String]
    let term: Int?
    
    static var mocked: Self {
        Self(
            clientTypes: [
                "ac43d7e4-cd8c-4f6f-b18a-5ccbc1356f75"
            ],
            cost: 850000,
            initialFee: 200000,
            kaskoValue: 71577182,
            language: .ru,
            residualPayment: 37.03896869,
            settingsName: "Haval",
            specialConditions: [
                "57ba0183-5988-4137-86a6-3d30a4ed8dc9",
                "b907b476-5a26-4b25-b9c0-8091e9d5c65f",
                "cbfc4ef3-af70-4182-8cf6-e73f361d1e68"
            ],
            term: 5
        )
    }
}
