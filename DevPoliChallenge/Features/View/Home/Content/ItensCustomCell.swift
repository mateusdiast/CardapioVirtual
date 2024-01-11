//
//  CustonCell.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ItensCustomCell: UITableViewCell {
    
    static let identifier = "customCell"

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = DesignSystem.Colors.primary
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupView(){
        addSubview(container)
        backgroundColor = .clear
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([

            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
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
