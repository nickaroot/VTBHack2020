//
//  MarketplaceService.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//

import Alamofire

public class MarketplaceService {
    class func getMarketplace(completion: @escaping (Marketplace?, Error?) -> Void) {
        let marketplaceUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/marketplace"
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(marketplaceUrl, headers: [tokenHeader]).responseDecodable(of: Marketplace.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
}
