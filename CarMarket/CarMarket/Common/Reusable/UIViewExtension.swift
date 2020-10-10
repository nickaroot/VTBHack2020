//
//  UIViewExtension.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import UIKit

extension UIView {
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.bounds
        gradientLayer.name = "gradientLayer"
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func removeGradientLayer() {
        if let layers = layer.sublayers {
            for layer in layers where layer.name == "gradientLayer" {
                layer.removeFromSuperlayer()
            }
        }
    }
}
