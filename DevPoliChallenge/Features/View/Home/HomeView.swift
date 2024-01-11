//
//  HomeView.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 20/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//


import UIKit

protocol HomeViewDelegate: AnyObject {
    func sendCategoryClicked(nameOfButton: String)
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?

    
    private lazy var container: UIView = {
        let view = UIView()
        view.addSubview(itensView)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     
    lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itensView: ItensView = {
        let itensView = ItensView()
        itensView.translatesAutoresizingMaskIntoConstraints = false
        itensView.backgroundColor = .white
        return itensView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        headerView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = DesignSystem.Colors.background
        self.addSubview(headerView)
        self.addSubview(itensView)
        
        
    }
    
    func getCategorys(data: [String]){
        headerView.setDataCategory(data: data)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([

            
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 43),
            
            itensView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            itensView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itensView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itensView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension HomeView: HeaderViewDelegate {
    func buttonClicked(nameOfButton: String) {
        delegate?.sendCategoryClicked(nameOfButton: nameOfButton)
    }
}
