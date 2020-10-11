//
//  Person.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct Person: Encodable {
    enum Gender: String, Encodable {
        case male, female, unknown
    }
    
    let birth_date_time: String
    let birth_place: String
    let family_name: String
    let first_name: String
    let gender: Gender
    let middle_name: String
    let nationality_country_code: String
    
}
