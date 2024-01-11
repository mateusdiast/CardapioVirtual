//
//  LookForViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 31/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol LookForViewModelDelegate: AnyObject {
    func goToNextView(titleCategory: String, price: String, description: String, title: String,  anothersTitle: [String], anothersDescription: [String], anothersPrice: [String])
    func showEmpty()
    func showContent(value: [ProductsModel], verify: Bool)
    func showSuggestion(value: String, randomItens: [ProductsModel], verify: Bool)
    func productsWasFounded(cell: ItensCustomCell, row: Int)
    func productsWasNotFounded(cell: ItensCustomCell, row: Int)
    func rowsInTheItensFounded() -> Int
    func rowsRandomItens() -> Int
}

final class LookForViewModel {
    
    var appetize: AppetizerModel?
    var meals: MealsModel?
    var fish: FishModel?
    var pasta: PastaModel?
    var dessert: DessertModel?
    var drinks: DrinksModel?
    
    var state = true
    var products: [ProductsModel] = []
    var anotherProducts: [ProductsModel] = []
    var searchedProducts: [ProductsModel] = []
    var randomItens: [ProductsModel] = []
    var verify: Bool = true
    
    weak var delegate: LookForViewModelDelegate?
    
    func verifyNumberOfRows() -> Int {
        if self.verify{
            return delegate?.rowsInTheItensFounded() ?? 0
        } else {
            return delegate?.rowsRandomItens() ?? 0
        }
    }
    
    func productsWasFounded(cell: ItensCustomCell, row: Int) {
        if self.verify {
            delegate?.productsWasFounded(cell: cell, row: row)
        }else{
            delegate?.productsWasNotFounded(cell: cell, row: row)
        }
    }
    
    func verifyStateOfTableView() -> [ProductsModel]{
        if self.state {
            return searchedProducts
        } else {
            return randomItens
        }
    }
    
    func verifySearch(textValue: String, products: [ProductsModel]){
        
          searchedProducts = products.filter(
            {
                $0.titleProduct.contains(textValue) ||
                $0.category.title.contains(textValue)
            })
        
        if searchedProducts.isEmpty && textValue != "" {
            let selectedItens = products.shuffled()
            let randomItens =  Array(selectedItens.prefix(6))
            self.state = false
            self.verify = false
            delegate?.showSuggestion(value: textValue, randomItens: randomItens, verify: verify)
        } else if textValue == "" {
            delegate?.showEmpty()
        } else {
            self.state = true
            self.verify = true
            delegate?.showContent(value: searchedProducts, verify: true)
        }
        
            
    }
    
    
    func verifyViewToNavigation(row: Int,  anotherProducts: [ProductsModel]){
        
        self.products = verifyStateOfTableView()
        
        self.anotherProducts = anotherProducts
        
        setDatasForCategory()
        
        let price = String(format: "%.2f", self.products [row].price)
        
        
        if products[row].category.id == 1{
            
            
            var anothersTitle = appetize.map({$0.title})
            var anothersDescription = appetize.map({$0.description})
            var anothersPrice = appetize.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products[row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
            
        } else if products[row].category.id == 2{
            
            var anothersTitle = meals.map({$0.title})
            var anothersDescription = meals.map({$0.description})
            var anothersPrice = meals.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products [row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
            
        } else if products[row].category.id == 3{
            
            var anothersTitle = fish.map({$0.title})
            var anothersDescription = fish.map({$0.description})
            var anothersPrice = fish.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products [row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
            
        } else if products[row].category.id == 4{
            
            var anothersTitle = pasta.map({$0.title})
            var anothersDescription = pasta.map({$0.description})
            var anothersPrice = pasta.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products [row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
            
        } else if products[row].category.id == 5{
            
            var anothersTitle = dessert.map({$0.title})
            var anothersDescription = dessert.map({$0.description})
            var anothersPrice = dessert.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                print(index)
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products [row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
            
        } else if products[row].category.id == 6{
            
            var anothersTitle = drinks.map({$0.title})
            var anothersDescription = drinks.map({$0.description})
            var anothersPrice = drinks.map({$0.price})
            if let index = anothersTitle?.firstIndex(of: self.products[row].titleProduct) {
                anothersTitle?.remove(at: index)
                anothersPrice?.remove(at: index)
                anothersDescription?.remove(at: index)
            }
            delegate?.goToNextView(titleCategory: self.products [row].category.title, price: price, description: self.products [row].description, title: self.products [row].titleProduct, anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        }
                                    
    }
    
    func setDatasForCategory() {
        
        
        let appetizeProductsTitle = anotherProducts.filter{$0.category.title == "Entrada"}.map{$0.titleProduct}
        let appetizeProductsDescription = anotherProducts.filter{$0.category.title == "Entrada"}.map{$0.description}
        let appetizeProductsPrice =  anotherProducts.filter{$0.category.title == "Entrada"}.map{String(format: "%.2f", $0.price)}
        
        let mealsProductsTitle = anotherProducts.filter{$0.category.title == "Carnes"}.map{$0.titleProduct}
        let mealsProductsDescription = anotherProducts.filter{$0.category.title == "Carnes"}.map{$0.description}
        let mealsProductsPrice =  anotherProducts.filter{$0.category.title == "Carnes"}.map{String(format: "%.2f", $0.price)}
        
        let fishProductsTitle = anotherProducts.filter{$0.category.title == "Peixe"}.map{$0.titleProduct}
        let fishProductsDescription = anotherProducts.filter{$0.category.title == "Peixe"}.map{$0.description}
        let fishProductsPrice =  anotherProducts.filter{$0.category.title == "Peixe"}.map{String(format: "%.2f", $0.price)}
        
        let pastaProductsTitle = anotherProducts.filter{$0.category.title == "Massas"}.map{$0.titleProduct}
        let pastaProductsDescription = anotherProducts.filter{$0.category.title == "Massas"}.map{$0.description}
        let pastaProductsPrice =  anotherProducts.filter{$0.category.title == "Massas"}.map{String(format: "%.2f", $0.price)}
        
        let dessertProductsTitle = anotherProducts.filter{$0.category.title == "Sobremesas"}.map{$0.titleProduct}
        let dessertProductsDescription = anotherProducts.filter{$0.category.title == "Sobremesas"}.map{$0.description}
        let dessertProductsPrice =  anotherProducts.filter{$0.category.title == "Sobremesas"}.map{String(format: "%.2f", $0.price)}
        
        let drinksProductsTitle = anotherProducts.filter{$0.category.title == "Bebidas"}.map{$0.titleProduct}
        let drinksProductsDescription = anotherProducts.filter{$0.category.title == "Bebidas"}.map{$0.description}
        let drinksProductsPrice =  anotherProducts.filter{$0.category.title == "Bebidas"}.map{String(format: "%.2f", $0.price)}
        
        appetize = AppetizerModel(title: appetizeProductsTitle, price: appetizeProductsPrice, description: appetizeProductsDescription)
        meals = MealsModel(title: mealsProductsTitle, price: mealsProductsPrice, description: mealsProductsDescription)
        fish = FishModel(title: fishProductsTitle, price: fishProductsPrice, description: fishProductsDescription)
        pasta = PastaModel(title: pastaProductsTitle, price: pastaProductsPrice, description: pastaProductsDescription)
        dessert = DessertModel(title: dessertProductsTitle, price: dessertProductsPrice, description: dessertProductsDescription)
        drinks = DrinksModel(title: drinksProductsTitle, price: drinksProductsPrice, description: drinksProductsDescription)
    }
    
}
