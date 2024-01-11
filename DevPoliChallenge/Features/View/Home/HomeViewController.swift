//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
    
    let homeView = HomeView()
    let homeViewModel = HomeViewModel()
    
    var titleCategoryUnique: [String] = []
    var titleLabel: String?
    var priceLabel: String?
    var descriptionLabel: String?
    var titleCategoryLabel: String?

    var numberOfRows: Int?
    let searchBar = SearchBarCustom()


    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        homeView.itensView.tableView.delegate = self
        homeView.itensView.tableView.dataSource = self
        homeViewModel.delegate = self
        homeView.delegate = self
        homeViewModel.getDatas()
        homeView.getCategorys(data: self.titleCategoryUnique)
        navigationItem.titleView = searchBar
        tapGestureSearchBar()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    @objc private func tapSearchBar(){
        homeViewModel.getDatasToSearch()
    }
    
    func tapGestureSearchBar(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSearchBar))
        searchBar.addGestureRecognizer(gesture)
        searchBar.isUserInteractionEnabled = true
    }

}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewModel.verifyNextDestination(section: indexPath.section, row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = DesignSystem.Colors.tertiary
        }
    }
    
    
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        homeViewModel.verifyNumberOfRows(section: section)
        
        guard let numberOfRows = numberOfRows else {
            return 0
        }
        
        return numberOfRows
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItensCustomCell.identifier, for: indexPath) as! ItensCustomCell
        
        homeViewModel.verifyDatasInTheRows(section: indexPath.section, row: indexPath.row)
        
        if let titleLabel = titleLabel {
            cell.titleLabel.text = titleLabel
        }
        if let descriptionLabel = descriptionLabel{
            cell.descriptionLabel.text = descriptionLabel
        }
        if let priceLabel = priceLabel{
            let text = priceLabel.replacingOccurrences(of: ".", with: ",")
            cell.priceLabel.attributedText = text.descreaseText()
        }
        
        return cell
    } 
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleCategoryUnique[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleCategoryUnique.count
    }
    
    
}

//MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func goToSearcView(products: [ProductsModel]) {
        let vc = LookForViewController()
        vc.products = products
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToNextVc(vc: Any, title: String, description: String, category: String, price: String, anothersTitle: [String], anothersDescription: [String], anothersPrice: [String]) {
        guard let vc = vc as? DetailsViewController else {return}
        vc.sendDatas(title: title, description: description, price: price, category: category,  anothersTitle: anothersTitle, anothersDescription: anothersDescription, anothersPrice: anothersPrice)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollingToTheSection(indexPath: IndexPath) {
        homeView.itensView.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func sendTitleCategoryUnique(titleCategoryUnique: [String]) {
        self.titleCategoryUnique = titleCategoryUnique
    }
    
    func sendDataOfTheRow(title: String, titleCategory: String, price: String, description: String) {
        titleLabel = title
        titleCategoryLabel = titleCategory
        priceLabel = price
        descriptionLabel = description
    }
    
    
    func fetchNumberOfSections(section: Int){
        numberOfRows = section
    }

}

//MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    func sendCategoryClicked(nameOfButton: String){
        homeViewModel.verifyCategoryClicked(nameOfButton: nameOfButton)
    }
}

    


