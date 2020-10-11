//
//  RFTextAttributes+Attributes.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

public extension RFTextAttributes {
    var attributes: [NSAttributedString.Key: Any] {
        var attributes = [NSAttributedString.Key: Any]()
        
        if let color = self.color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        if let font = self.font {
            attributes[NSAttributedString.Key.font] = font
        }
        
        if let letterSpacing = self.letterSpacing {
            attributes[NSAttributedString.Key.kern] = letterSpacing
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let lineHeight = self.lineHeight {
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.minimumLineHeight = lineHeight
        }
        
        if let alignment = self.alignment {
            paragraphStyle.alignment = alignment
        }
        
        if let baselineOffset = self.baselineOffset {
            attributes[NSAttributedString.Key.baselineOffset] = baselineOffset
        }
        
        if let lineBreak = self.lineBreak {
            paragraphStyle.lineBreakMode = lineBreak
        }
        
        if let underlineStyle = self.underline.0 {
            attributes[NSAttributedString.Key.underlineStyle] = underlineStyle.rawValue
        }
        
        if let underlineColor = self.underline.1 {
            attributes[NSAttributedString.Key.underlineColor] = underlineColor
        }
        
        if let strikethroughStyle = self.strikethrough.0 {
            attributes[NSAttributedString.Key.strikethroughStyle] = strikethroughStyle.rawValue
        }
        
        if let strikethroughColor = self.strikethrough.1 {
            attributes[NSAttributedString.Key.strikethroughColor] = strikethroughColor
        }
        
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        
        return attributes
    }
    
    init(_ attributes: [NSAttributedString.Key: Any]) {
        for attribute in attributes {
            switch attribute.key {
            
            case .foregroundColor:
                self.color = attribute.value as? UIColor
                
            case .font:
                self.font = attribute.value as? UIFont
                
            case .kern:
                self.letterSpacing = attribute.value as? NSNumber
                
            case .paragraphStyle:
                self.lineHeight = (attribute.value as? NSParagraphStyle)?.maximumLineHeight ??
                    (attribute.value as? NSParagraphStyle)?.minimumLineHeight
                self.alignment = (attribute.value as? NSParagraphStyle)?.alignment
                self.lineBreak = (attribute.value as? NSParagraphStyle)?.lineBreakMode
                self.alignment = (attribute.value as? NSParagraphStyle)?.alignment
                
            case .underlineStyle:
                guard let rawValue = attribute.value as? Int else { continue }
                
                self.underline.0 = NSUnderlineStyle(rawValue: rawValue)
                
            case .underlineColor:
                self.underline.1 = attribute.value as? UIColor
                
            case .strikethroughStyle:
                guard let rawValue = attribute.value as? Int else { continue }
                
                self.strikethrough.0 = NSUnderlineStyle(rawValue: rawValue)
                
            case .strikethroughColor:
                self.strikethrough.1 = attribute.value as? UIColor
                
            default:
                continue
            }
        }
    }
}
