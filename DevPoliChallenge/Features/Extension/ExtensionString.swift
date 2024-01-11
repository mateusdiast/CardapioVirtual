//
//  ExtensionString.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 01/01/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

extension String {
    
    func boldText(ofSize: Int, searchTerm: String) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        let range = (self as NSString).range(of: searchTerm)
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: CGFloat(ofSize)), range: range)
        return attributeString
    }
    
    func descreaseText() -> NSAttributedString {
        
        let attributeString = NSMutableAttributedString(string: self)
        let caractereToRange = self.range(of: ",")
        var substringAfterCaractere: String = ""
        if let startIndex = caractereToRange?.upperBound {
            substringAfterCaractere = String(self[startIndex...])
        }
        
        let range = (self as NSString).range(of: substringAfterCaractere)
        
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: CGFloat(16)), range: range)
        
        return attributeString
    }
    
    
}


