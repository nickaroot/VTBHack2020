//
//  CarRecognitionService.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/11/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import Alamofire
import UIKit

public class CarRecognitionService {
    class func base64Image(_ image: UIImage?) -> String? {
        guard let image = image else { return nil }
        
        let jpgImage = image.jpegData(compressionQuality: 0.2)
        
        return jpgImage?.base64EncodedString()
    }
    
    class func recognizeCarByPhotoBase64(_ photoBase64: String?, completion: @escaping (CarRecognitionResponse?, Error?) -> Void) {
        guard let photoBase64 = photoBase64 else { return completion(nil, NSError()) }
        
        let carRecognizeUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/car-recognize"
        
        let parameters = CarImage(content: photoBase64)
        
        let tokenHeader = HTTPHeader(name: "x-ibm-client-id", value: "add660da60a5465f94168c21269bd4b4")
        
        AF.request(carRecognizeUrl, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,
                   headers: [tokenHeader]).responseDecodable(of: CarRecognitionResponse.self) { resp in
                    
                    if case let .success(response) = resp.result {
                        completion(response, nil)
                    } else if case let .failure(error) = resp.result {
                        completion(nil, error)
                    }
                   }
    }
}
