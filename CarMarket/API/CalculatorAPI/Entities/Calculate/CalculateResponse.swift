//
//  CalculateResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CalculateResponse: Decodable {
    let program: ProgramResponse?
    let ranges: Ranges?
    let result: CalcResult?
}
