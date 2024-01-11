//
//  ProductsModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation



struct Result: Codable {
    let produtos: [ProductsModel]
}

struct ProductsModel: Codable {
    let id: Int
    let titleProduct: String
    let description: String
    let price: Double
    let category: ProductsCategory
    
    enum CodingKeys: String, CodingKey{
        case id
        case titleProduct = "title"
        case description
        case price
        case category
    }
}

struct ProductsCategory: Codable {
    let id: Int
    let title: String
}
