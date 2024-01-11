//
//  LookForView.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 30/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit



final class LookForView: UIView {
    
    var verify: Bool = true
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = DesignSystem.Colors.background
        tableView.isHidden = true
        return tableView
    }()
    

     lazy var labelSearch: UILabel = {
        let label = UILabel()
        label.text = "Resultado da busca"
        label.textColor = DesignSystem.Colors.tertiary
        label.font = UIFont.systemFont(ofSize: 16)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var resultLabelSearch: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = DesignSystem.Colors.tertiary
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var labelSuggestions: UILabel = {
        let label = UILabel()
        label.text = "Veja nossa sugestão"
        label.textColor = DesignSystem.Colors.tertiary
        label.font = UIFont.systemFont(ofSize: 16)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(labelSearch)
        addSubview(tableView)
        backgroundColor = DesignSystem.Colors.background
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ItensCustomCell.self, forCellReuseIdentifier: ItensCustomCell.identifier)
        tableView.rowHeight = 64
    }
    
    func setupConstraintsTableView(verify: Bool){
        self.verify = verify
        if self.verify == true{
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: topAnchor, constant: 136),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }else{
            tableView.removeFromSuperview()
            addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: resultLabelSearch.bottomAnchor, constant: 60),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        }
    }
    
    
    private func setupConstraints(){
        
        
        
        NSLayoutConstraint.activate([
       
            
            labelSearch.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelSearch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    func setupLabelSuggestions(){
        addSubview(labelSuggestions)
        NSLayoutConstraint.activate([
            labelSuggestions.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -16),
            labelSuggestions.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }

    
    func setupResultLabelSearch(){
        addSubview(resultLabelSearch)
        NSLayoutConstraint.activate([
            resultLabelSearch.topAnchor.constraint(equalTo: labelSearch.topAnchor, constant: 50),
            resultLabelSearch.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setItemSearchedValue(value: String){
        
        let textAttributed = "Nenhum resultado \nencontrado para \(value)"
        resultLabelSearch.attributedText = textAttributed.boldText(ofSize: 16, searchTerm: value)
        
        
    }
    
 


}


