//
//  ExtensionUITextField.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {
    

    func setupSearchImage() {
            
            let imageView = UIImageView(frame: CGRect(x: 12 , y: -11, width: 25, height: 25))
            let image = UIImage(named: "searchIcon")
            let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: self.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageContainer.addSubview(imageView)
            rightView = imageContainer
            rightViewMode = .always
            
    }
    
    func setupPaddingText(){
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        leftViewMode = .always
    }
    
    
    func placeholderColor(_ color: UIColor) -> NSAttributedString?{
        
        if let placeholder = self.placeholder{
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            if let attributedPlaceholder = self.attributedPlaceholder {
                return attributedPlaceholder
            }
        }
        return nil
    }
}
