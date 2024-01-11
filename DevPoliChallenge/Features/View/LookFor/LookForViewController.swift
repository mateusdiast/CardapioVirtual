//
//  LookForViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 30/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LookForViewController: UIViewController{
    
    var randomItens: [ProductsModel] = []
    
    var products: [ProductsModel] = []
    
    var searchedProducts: [ProductsModel] = []
    
    let searchBar = SearchBarCustom()
   
    let lookForView = LookForView()
    
    let lookForViewModel = LookForViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        navigationItem.titleView = searchBar
        lookForView.tableView.delegate = self
        lookForView.tableView.dataSource = self
        lookForViewModel.delegate = self
        searchBar.delegate = self
        view.backgroundColor = DesignSystem.Colors.background
        self.searchedProducts = products
    }
    
    override func loadView() {
        self.view = lookForView
    }

}

//MARK: - UITextFieldDelegate

extension LookForViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let textValue = textField.text {
            lookForViewModel.verifySearch(textValue: textValue, products: products)
        }

    }
}

//MARK: - UITableViewDelegate

extension LookForViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lookForViewModel.verifyViewToNavigation(row: indexPath.row, anotherProducts: products)
    }
}

//MARK: - UITableViewDataSource

extension LookForViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lookForViewModel.verifyNumberOfRows()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItensCustomCell.identifier, for: indexPath) as! ItensCustomCell
        
        lookForViewModel.productsWasFounded(cell: cell, row: indexPath.row)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//MARK: - LookForViewModelDelegate

extension LookForViewController: LookForViewModelDelegate {
    
    func rowsInTheItensFounded() -> Int {
        return searchedProducts.count
    }
    
    func rowsRandomItens() -> Int {
        return randomItens.count
    }
    
    
    func productsWasFounded(cell: ItensCustomCell, row: Int) {
        cell.titleLabel.text = searchedProducts[row].titleProduct
        cell.descriptionLabel.text = searchedProducts[row].description
        let priceLabel = String(format: "%.2f", searchedProducts[row].price)
        let text = priceLabel.replacingOccurrences(of: ".", with: ",")
        cell.priceLabel.attributedText = text.descreaseText()
    }
    
    func productsWasNotFounded(cell: ItensCustomCell, row: Int) {
        cell.titleLabel.text = randomItens[row].titleProduct
        cell.descriptionLabel.text = randomItens[row].description
        let priceLabel = String(format: "%.2f", randomItens[row].price)
        let text = priceLabel.replacingOccurrences(of: ".", with: ",")
        cell.priceLabel.attributedText = text.descreaseText()
    }
    

    
    
    func showContent(value: [ProductsModel], verify: Bool) {
        searchedProducts = value
        lookForView.resultLabelSearch.isHidden = true
        lookForView.labelSuggestions.isHidden = true
        lookForView.tableView.isHidden = false
        lookForView.labelSearch.isHidden = false
        lookForView.setupConstraintsTableView(verify: verify)
        lookForView.tableView.reloadData()
    }
    
    func showSuggestion(value: String, randomItens: [ProductsModel], verify: Bool) {
        lookForView.setItemSearchedValue(value: value)
        lookForView.tableView.isHidden = false
        lookForView.labelSearch.isHidden = false
        lookForView.resultLabelSearch.isHidden = false
        lookForView.labelSuggestions.isHidden = false
        lookForView.setupResultLabelSearch()
        lookForView.setupConstraintsTableView(verify: verify)
        lookForView.setupLabelSuggestions()
        self.randomItens = randomItens
        lookForView.tableView.reloadData()
    }
    
    
    func showEmpty() {
        lookForView.tableView.isHidden = true
        lookForView.labelSearch.isHidden = true
        lookForView.resultLabelSearch.isHidden = true
        lookForView.labelSuggestions.isHidden = true
    }
    
    
    func goToNextView(titleCategory: String, price: String, description: String, title: String, anothersTitle: [String], anothersDescription: [String], anothersPrice: [String]) {
        let vc = DetailsViewController()
        vc.sendDatas(title: title, description: description, price: price, category: titleCategory, anothersTitle: anothersTitle, anothersDescription: anothersDescription, anothersPrice: anothersPrice)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
