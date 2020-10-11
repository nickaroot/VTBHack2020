//
//  CalculatorService.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Alamofire

public class CalculatorService {
    class func calculate(with parameters: CalculateParameters, completion: @escaping (CalculateResponse?, Error?) -> Void) {
        let calculateUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/calculate"
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(calculateUrl, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,
                   headers: [tokenHeader]).responseDecodable(of: CalculateResponse.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
    
    class func getPaymentsGraph(with parameters: GraphParameters, completion: @escaping (GraphResponse?, Error?) -> Void) {
        let paymentsGraphUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/payments-graph"
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(paymentsGraphUrl, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,
                   headers: [tokenHeader]).responseDecodable(of: GraphResponse.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
    
    /// Not working (404)
    
    class func getSettings(with parameters: SettingsParameters, completion: @escaping (SettingsResponse?, Error?) -> Void) {
        let settingsUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/settings"
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(settingsUrl, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default,
                   headers: [tokenHeader]).responseDecodable(of: SettingsResponse.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
}
