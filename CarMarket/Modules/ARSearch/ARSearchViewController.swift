//
//  ARSearchViewController.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import SwiftMessages

class ARSearchViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = false
        
        sceneView.delegate = self
        
        sceneView.showsFPS = false
        sceneView.showsNodeCount = false
        
        let scene = Scene(size: self.view.frame.size)
        sceneView.presentScene(scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let helpContent = SwiftMessages.Content(
            body: "Наведите камеру на машину и нажмите на нее",
            buttonText: "ОК"
        )
        
        SwiftMessages.showBottomInfo(
            helpContent,
            isHideOnTapEnabled: true,
            isAutoHide: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        guard let identifier = ARBridge.shared.anchorsToIdentifiers[anchor] else {
            return nil
        }
        
        let shapeNode = SKShapeNode(rectOf: CGSize(width: 200, height: 120), cornerRadius: 8)
        
        shapeNode.fillColor = UIColor(red: 0, green: 0.667, blue: 1, alpha: 1)
        
        let titleAttributes = RFTextAttributes(
            color: .white,
            font: .systemFont(ofSize: 16, weight: .regular),
            lineHeight: 20
        )
        
        let attributedText = NSAttributedString(
            string: identifier.0,
            attributes: titleAttributes.attributes
        )
        
        let titleLabelNode = SKLabelNode(attributedText: attributedText)
        
        titleLabelNode.horizontalAlignmentMode = .center
        titleLabelNode.verticalAlignmentMode = .bottom
        
        shapeNode.addChild(titleLabelNode)
        
        if let cost = identifier.1 {
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            
            if let formattedCost = formatter.string(from: NSNumber(integerLiteral: cost)) {
                let subtitleAttributes = RFTextAttributes(
                    color: .white,
                    font: .systemFont(ofSize: 22, weight: .bold),
                    lineHeight: 28
                )
                
                let attributedText = NSAttributedString(
                    string: "\nот \(formattedCost) ₽",
                    attributes: subtitleAttributes.attributes
                )
                
                let subtitleLabelNode = SKLabelNode(attributedText: attributedText)
                
                subtitleLabelNode.horizontalAlignmentMode = .center
                subtitleLabelNode.verticalAlignmentMode = .top
                
                titleLabelNode.position.y += 10
                subtitleLabelNode.position.y -= 10
                
                shapeNode.addChild(subtitleLabelNode)
            }
        }
        
        return shapeNode
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
