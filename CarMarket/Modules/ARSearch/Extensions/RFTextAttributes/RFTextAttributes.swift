//
//  RFTextAttributes.swift
//  arkit-testing-2
//
//  Created by Nikita Arutyunov on 10/10/20.
//  Copyright © 2020 Nickaroot.ME. All rights reserved.
//

import UIKit

public struct RFTextAttributes {
    public var color: UIColor? = nil
    public var font: UIFont? = nil
    public var letterSpacing: NSNumber? = nil
    public var lineHeight: CGFloat? = nil
    public var alignment: NSTextAlignment? = nil
    public var baselineOffset: CGFloat? = nil
    public var lineBreak: NSLineBreakMode? = nil
    public var strikethrough: (NSUnderlineStyle?, UIColor?) = (nil, nil)
    public var underline: (NSUnderlineStyle?, UIColor?) =  (nil, nil)
    
    public init(color: UIColor?, font: UIFont?,
                letterSpacing: Double? = nil,
                lineHeight: CGFloat? = nil,
                alignment: NSTextAlignment? = nil,
                baselineOffset: CGFloat? = nil,
                lineBreak: NSLineBreakMode? = nil,
                underline: (NSUnderlineStyle?, UIColor?) = (nil, nil),
                strikethrough: (NSUnderlineStyle?, UIColor?) = (nil, nil)) {
        self.color = color
        self.font = font
        
        if let letterSpacing = letterSpacing {
            self.letterSpacing = NSNumber(floatLiteral: letterSpacing)
        }
        
        self.lineHeight = lineHeight
        self.alignment = alignment
        self.baselineOffset = baselineOffset
        self.lineBreak = lineBreak
        self.underline = underline
        self.strikethrough = strikethrough
    }
}
