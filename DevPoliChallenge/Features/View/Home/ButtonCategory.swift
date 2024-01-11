//
//  buttonCategory.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 27/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class ButtonCategory: UIButton {

 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
        setTitleColor( DesignSystem.Colors.primary, for: .normal)
        layer.cornerRadius = 8
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = DesignSystem.Colors.primary.cgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        setTitleColor(DesignSystem.Colors.primary, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
//            buttonCategory.topAnchor.constraint(equalTo: stackView.topAnchor),
//            buttonCategory.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    

}


