//
//  HeaderView.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func buttonClicked(nameOfButton: String)
}

final class HeaderView: UIView {
    
    private var datas: [String] = []
    private var buttonSelected: String = ""
    
    
    weak var delegate: HeaderViewDelegate?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            scrollView.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo:  scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
    }
    
    private func renderUI(){
        for data in datas {
            stackView.addArrangedSubview(passDataToButton(data: data))
        }
    }
    
    func getButtonSelected() -> String{
        self.buttonSelected
    }
    
    @objc private func categorySelected(_ sender: UIButton){
        guard let sender = sender.titleLabel?.text else {return}
        delegate?.buttonClicked(nameOfButton: sender)
    }
    
    private func passDataToButton(data: String) -> UIButton {
        let buttonCategory = ButtonCategory()
        buttonCategory.setTitle(data, for: .normal)
        buttonCategory.addTarget(self, action: #selector(categorySelected), for: .touchUpInside)
        return buttonCategory
    }
    
    func setDataCategory(data: [String]){
        self.datas = data
        renderUI()
    }

}
