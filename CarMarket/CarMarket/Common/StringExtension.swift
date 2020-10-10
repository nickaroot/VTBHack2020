//
//  StringExtension.swift
//  CarMarket
//
//  Created by Виталий Рамазанов on 10.10.2020.
//

import Foundation

extension String {
    func localized(withComment comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func localized() -> String {
        return localized(withComment: "")
    }
}
