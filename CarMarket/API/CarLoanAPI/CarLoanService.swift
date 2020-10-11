//
//  CarLoanService.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Alamofire

public class CarLoanService {
    class func getCarloan(with parameters: CarLoanParameters, completion: @escaping (CarLoanResponse?, Error?) -> Void) {
        let carloanUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/carloan"
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(carloanUrl, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,
                   headers: [tokenHeader]).responseDecodable(of: CarLoanResponse.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
}
