//
//  ProductsService.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate: AnyObject{
    func getDatasFromAPI(products: [ProductsModel])
}


final class ProductsService {
    
    weak var delegate: ProductsServiceDelegate?
    
    var productsModel: Result?
    
    
    
    func parseJSON(){
        guard let path = Bundle.main.path(forResource: "getCardapio", ofType: "json")  else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf: url)
            productsModel = try JSONDecoder().decode(Result.self, from: data)
            guard let products = productsModel?.produtos else {return}
            
            delegate?.getDatasFromAPI(products: products)
        }catch{
            print("Error\(error)")
        }
        
    }
}
