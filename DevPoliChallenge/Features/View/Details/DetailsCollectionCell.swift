//
//  DetailsCollectionCell.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 28/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsCollectionCell: UICollectionViewCell {
    
    static let identifier = "customCell"
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        return view
    }()
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Label"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "00,00"
        label.textColor = DesignSystem.Colors.primary
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
        addSubview(container)
        backgroundColor = .clear
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 13),
            container.widthAnchor.constraint(equalToConstant: 253),
            
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -73),
            
            priceLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12)
            
        ])
    }
    
    
    
}
