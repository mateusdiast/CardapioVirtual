//
//  SearchBarCustom.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SearchBarCustom: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        layer.cornerRadius = 8
        backgroundColor = .white
        textColor = .black
        placeholder = "O que vai ser hoje?"
        attributedPlaceholder = placeholderColor(DesignSystem.Colors.placeHolderColor)
        translatesAutoresizingMaskIntoConstraints = false
        setupPaddingText()
        setupSearchImage()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45),
            self.widthAnchor.constraint(equalToConstant: 358)
        ])
    }
}

