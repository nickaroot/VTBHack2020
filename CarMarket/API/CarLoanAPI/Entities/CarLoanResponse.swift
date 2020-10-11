//
//  CarLoanResponse.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Foundation

struct CarLoanResponse: Decodable {
    struct Application: Decodable {
        let VTB_client_ID: Int?
        
        struct Decision: Decodable {
            enum ApplicationStatus: String, Decodable {
                case prescore_approved, prescore_denied, processing
            }
            
            let application_status: ApplicationStatus?
            let comment: String?
            let decision_date: String?
            let decision_end_date: String?
            let monthly_payment: Decimal?
        }
            
        let decision_report: Decision?
    }
    
    let application: Application?
    let datetime: String?
    
}
