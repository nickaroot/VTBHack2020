//
//  GraphResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct GraphResponse: Decodable {
    let payments: [Payment]?
}
