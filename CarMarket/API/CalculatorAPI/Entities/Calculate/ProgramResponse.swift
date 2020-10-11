//
//  ProgramResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct ProgramResponse: Decodable {
    let cost: Field?
    let id: String?
    let programName: String?
    let programUrl: String?
    let requestUrl: String?
}
