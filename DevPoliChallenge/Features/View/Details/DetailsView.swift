//
//  DetailsView.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 25/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit


final class DetailsView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 3
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Valor"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = DesignSystem.Colors.accent
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var containerTitle: UIView = {
        let view = UIView()
        view.addSubview(titleLabel)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var containerCategory: UIView = {
        let view = UIView()
        view.addSubview(categoryLabel)
        view.backgroundColor = DesignSystem.Colors.secondary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerFooter: UIView = {
        let view = UIView()
        view.addSubview(valueLabel)
        view.addSubview(priceLabel)
        view.backgroundColor = DesignSystem.Colors.tertiary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = DesignSystem.Colors.background
        addSubview(containerTitle)
        addSubview(containerCategory)
        addSubview(descriptionLabel)
        addSubview(collectionView)
        addSubview(containerFooter)
        collectionView.register(DetailsCollectionCell.self, forCellWithReuseIdentifier: DetailsCollectionCell.identifier)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            
            containerTitle.topAnchor.constraint(equalTo: self.topAnchor),
            containerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerTitle.heightAnchor.constraint(equalToConstant: 169),
            
            titleLabel.bottomAnchor.constraint(equalTo: containerTitle.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: containerTitle.leadingAnchor, constant: 22),
            
            containerCategory.topAnchor.constraint(equalTo: containerTitle.bottomAnchor),
            containerCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerCategory.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerCategory.heightAnchor.constraint(equalToConstant: 35),
            
            categoryLabel.leadingAnchor.constraint(equalTo: containerCategory.leadingAnchor, constant: 22),
            categoryLabel.centerYAnchor.constraint(equalTo: containerCategory.centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: containerCategory.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            
            containerFooter.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerFooter.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerFooter.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerFooter.heightAnchor.constraint(equalToConstant: 127),
            
            
            collectionView.bottomAnchor.constraint(equalTo: containerFooter.topAnchor, constant: -23),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 64),
            
            valueLabel.topAnchor.constraint(equalTo: containerFooter.topAnchor, constant: 16),
            valueLabel.leadingAnchor.constraint(equalTo: containerFooter.leadingAnchor, constant: 16),
            
            priceLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: containerFooter.leadingAnchor, constant: 16),
            
        ])
    }
    
    func setDatas(title: String, description: String, price: String, category: String){
        titleLabel.text = title
        categoryLabel.text = category
        descriptionLabel.text = description
        priceLabel.text = "R$ \(price.replacingOccurrences(of: ".", with: ","))"
    }
    
}



