//
//  DetailsViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 25/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    
    var anothersTitle: [String] = []
    var anothersDescription: [String] = []
    var anothersPrice: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        
        detailsView.collectionView.delegate = self
        detailsView.collectionView.dataSource = self
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(UIImage(named: "backIcon"), transitionMaskImage: UIImage(named: "backIcon"))
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func loadView() {
        self.view = detailsView
    }
    
    func sendDatas(title: String, description: String, price: String, category: String,  anothersTitle: [String], anothersDescription: [String], anothersPrice: [String]){
        detailsView.setDatas(title: title, description: description, price: price, category: category)
        self.anothersTitle = anothersTitle
        self.anothersDescription = anothersDescription
        self.anothersPrice = anothersPrice
    }

}

extension DetailsViewController: UICollectionViewDelegate {
    
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anothersTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionCell.identifier, for: indexPath) as! DetailsCollectionCell
        cell.titleLabel.text = anothersTitle[indexPath.row]
        cell.descriptionLabel.text = anothersDescription[indexPath.row]
        let price = anothersPrice[indexPath.row]
        let text = price.replacingOccurrences(of: ".", with: ",")
        cell.priceLabel.attributedText = text.descreaseText()
   
        return cell
    }
}


extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 64)
    }
}
