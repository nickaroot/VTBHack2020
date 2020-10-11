//
//  Scene.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import SpriteKit
import ARKit
import Vision
import Alamofire
import SwiftMessages

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    class func success(carModel: CarModel, title: String, count: Int, cost: Int?, sceneView: ARSKView, currentFrame: ARFrame) {
        let successContent = SwiftMessages.Content(
            body: "Найдено \(count) предложений о продаже",
            buttonText: "Перейти"
        )
        
        SwiftMessages.hideAll()
        
        if count > 0 {
            SwiftMessages.showBottomSuccess(
                successContent,
                isHideOnTapEnabled: false,
                isAutoHide: false) { _ in
                
                let module = CarDetailsRouter.setupModuleWithNib(carModel: carModel)
                
                module.hidesBottomBarWhenPushed = true
                
                ARBridge.shared.navigationController?.pushViewController(module, animated: true)
            }
        }
        
        DispatchQueue.main.async {
            var translation = matrix_identity_float4x4
            
            translation.columns.3.z = -2.0
            
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            let anchor = ARAnchor(transform: transform)
            
            ARBridge.shared.anchorsToIdentifiers.removeAll()
            ARBridge.shared.anchorsToIdentifiers[anchor] = (title, cost)
            
            sceneView.scene?.removeAllChildren()
            sceneView.session.add(anchor: anchor)
        }
    }
    
    class func failure(sceneView: ARSKView, currentFrame: ARFrame) {
        let failureContent = SwiftMessages.Content(
            title: "Ничего не найдено",
            body: "Попробуйте другой ракурс или навести на\u{00a0}другую\u{00a0}машину"
        )
        
        SwiftMessages.hideAll()
        
        SwiftMessages.showBottomFailure(
            failureContent,
            isHideOnTapEnabled: true,
            isAutoHide: true
        )
        
        DispatchQueue.main.async {
            ARBridge.shared.anchorsToIdentifiers.removeAll()
            
            sceneView.scene?.removeAllChildren()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            let screenshot = UIImage(ciImage: CIImage(cvImageBuffer: currentFrame.capturedImage).oriented(.right))
            
            CarRecognitionService.recognizeCarByPhotoBase64(CarRecognitionService.base64Image(screenshot)) { (response, error) in
                guard error == nil, let response = response else {
                    return Self.failure(sceneView: sceneView, currentFrame: currentFrame)
                }
                
                guard let recognizedCar = response.probabilities.max(by: { $0.value < $1.value }),
                      recognizedCar.value >= 0.2 else {
                    return Self.failure(sceneView: sceneView, currentFrame: currentFrame)
                }
                
                let tokens = recognizedCar.key
                    .lowercased()
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .split(whereSeparator: { $0.isNewline || $0.isWhitespace })
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines )}
                
                if let marketplace = ARBridge.shared.marketplace {
                    guard let marketBrand = marketplace.list?.first(where: { carBrand -> Bool in
                        guard let title = carBrand.title?.lowercased(),
                              let titleRus = carBrand.titleRus?.lowercased() else { return false }
                        
                        return tokens.contains(title) || tokens.contains(titleRus)
                    }),
                    
                    let marketCar = marketBrand.models?.first(where: { car -> Bool in
                        guard let title = car.title?.lowercased(),
                              let titleRus = car.titleRus?.lowercased() else { return false }
                        
                        return tokens.contains(title) || tokens.contains(titleRus)
                    }) else {
                        return Self.failure(sceneView: sceneView, currentFrame: currentFrame)
                    }
                    
                    let title = recognizedCar.key
                    let marketCount = marketCar.count ?? 0
                    let cost = marketCar.minPrice
                    
                    Self.success(carModel: marketCar, title: title, count: marketCount, cost: cost,
                                 sceneView: sceneView, currentFrame: currentFrame)
                }
            }
            
//            DispatchQueue.global(qos: .background).async {
//                do {
//                    let model = try VNCoreMLModel(for: CarRecognition().model)
//                    let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
//                        // Jump onto the main thread
//                        DispatchQueue.main.async {
//                            // Access the first result in the array after casting the array as a VNClassificationObservation array
//                            guard let results = request.results as? [VNClassificationObservation], let result = results.first else {
//                                print ("No results?")
//                                return
//                            }
//
//                            // Create a transform with a translation of 0.2 meters in front of the camera
//                            var translation = matrix_identity_float4x4
//                            translation.columns.3.z = -0.4
//                            let transform = simd_mul(currentFrame.camera.transform, translation)
//
//                            // Add a new anchor to the session
//                            let anchor = ARAnchor(transform: transform)
//
//                            // Set the identifier
//                            ARBridge.shared.anchorsToIdentifiers[anchor] = result.identifier
//
//                            sceneView.session.add(anchor: anchor)
//                        }
//                    })
//
//                    let handler = VNImageRequestHandler(cvPixelBuffer: currentFrame.capturedImage, options: [:])
//                    try handler.perform([request])
//                } catch {}
//            }
        }
    }
}
