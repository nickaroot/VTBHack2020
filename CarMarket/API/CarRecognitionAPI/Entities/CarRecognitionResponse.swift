//
//  CarRecognitionResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import Foundation

struct CarRecognitionResponse: Decodable {
    let probabilities: [String: Double]
}
