//
//  HomeViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func sendDataOfTheRow(title: String, titleCategory: String, price: String, description: String)
    func goToNextVc(vc: Any, title: String, description: String, category: String, price: String, anothersTitle: [String], anothersDescription: [String], anothersPrice: [String])
    func fetchNumberOfSections(section: Int)
    func sendTitleCategoryUnique(titleCategoryUnique: [String])
    func scrollingToTheSection(indexPath: IndexPath)
    func goToSearcView(products: [ProductsModel])
}


final class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    let productsService = ProductsService()
    
    var appetize: AppetizerModel?
    var meals: MealsModel?
    var fish: FishModel?
    var pasta: PastaModel?
    var dessert: DessertModel?
    var drinks: DrinksModel?
 
    var titleCategoryUnique: [String] = []
    var productsInArray: [ProductsModel] = []

    
    init() {
        productsService.delegate = self
    }
    
    func getDatas(){
        productsService.parseJSON()
    }
    
    
    func verifyNextDestination(section: Int, row: Int){
        let sectionSelected = Sections(rawValue: section)
        let vc = DetailsViewController()
        switch sectionSelected {
        case .sectionAppetize:
            var anothersTitle = appetize.map({$0.title})
            var anothersDescription = appetize.map({$0.description})
            var anothersPrice = appetize.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: appetize!.title[row], description: appetize!.description[row], category: "Entrada", price: appetize!.price[row],  anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        case .sectionMeals:
            var anothersTitle = meals.map({$0.title})
            var anothersDescription = meals.map({$0.description})
            var anothersPrice = meals.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: meals!.title[row], description: meals!.description[row], category: "Carnes", price: meals!.price[row],  anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        case .sectionFish:
            var anothersTitle = fish.map({$0.title})
            var anothersDescription = fish.map({$0.description})
            var anothersPrice = fish.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: fish!.title[row], description: fish!.description[row], category: "Peixe", price: fish!.price[row],  anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        case .sectionPasta:
            var anothersTitle = pasta.map({$0.title})
            var anothersDescription = pasta.map({$0.description})
            var anothersPrice = pasta.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: pasta!.title[row], description: pasta!.description[row], category: "Massas", price: pasta!.price[row],  anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        case .sectionDessert:
            var anothersTitle = dessert.map({$0.title})
            var anothersDescription = dessert.map({$0.description})
            var anothersPrice = dessert.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: dessert!.title[row], description: dessert!.description[row], category: "Sobremesas", price: dessert!.price[row],  anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        case .sectionDrinks:
            var anothersTitle = drinks.map({$0.title})
            var anothersDescription = drinks.map({$0.description})
            var anothersPrice = drinks.map({$0.price})
            anothersTitle?.remove(at: row)
            anothersPrice?.remove(at: row)
            anothersDescription?.remove(at: row)
                delegate?.goToNextVc(vc: vc, title: drinks!.title[row], description: drinks!.description[row], category: "Bebidas", price: drinks!.price[row], anothersTitle: anothersTitle!, anothersDescription: anothersDescription!, anothersPrice: anothersPrice!)
        default:
            break
        }
     
    }
    
    func verifyNumberOfRows(section: Int){
        let optionsSections = Sections(rawValue: section)
        switch optionsSections {
        case .sectionAppetize:
            guard let numberOfRows = appetize?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        case .sectionMeals:
            guard let numberOfRows = meals?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        case .sectionFish:
            guard let numberOfRows = fish?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        case .sectionPasta:
            guard let numberOfRows = pasta?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        case .sectionDessert:
            guard let numberOfRows = dessert?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        case .sectionDrinks:
            guard let numberOfRows = drinks?.title.count else {return}
            delegate?.fetchNumberOfSections(section: numberOfRows)
        default:
            break
        }
    }
    
    func verifyDatasInTheRows(section: Int, row: Int){
        let optionsSections = Sections(rawValue: section)
        switch optionsSections {
        case .sectionAppetize:
            delegate?.sendDataOfTheRow(title: appetize!.title[row], titleCategory: "Entrada", price: appetize!.price[row], description: appetize!.description[row])
        case .sectionMeals:
            delegate?.sendDataOfTheRow(title: meals!.title[row], titleCategory: "Carnes", price: meals!.price[row], description: meals!.description[row])
        case .sectionFish:
            delegate?.sendDataOfTheRow(title: fish!.title[row], titleCategory: "Peixes", price: fish!.price[row], description: fish!.description[row])
        case .sectionPasta:
            delegate?.sendDataOfTheRow(title: pasta!.title[row], titleCategory: "Massas", price: pasta!.price[row], description: pasta!.description[row])
        case .sectionDessert:
            delegate?.sendDataOfTheRow(title: dessert!.title[row], titleCategory: "Sobremesas", price: dessert!.price[row], description: dessert!.description[row])
        case .sectionDrinks:
            delegate?.sendDataOfTheRow(title: drinks!.title[row], titleCategory: "Bebidas", price: drinks!.price[row], description: drinks!.description[row])
        default:
            break
        }
    }
    
    func verifyCategoryClicked(nameOfButton: String){
        
        if nameOfButton == "Entrada" {
            let indexPath = IndexPath(row: 0, section: 0)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        } else if nameOfButton == "Carnes"{
            let indexPath = IndexPath(row: 0, section: 1)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        } else if nameOfButton == "Peixe"{
            let indexPath = IndexPath(row: 0, section: 2)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        } else if nameOfButton == "Massas"{
            let indexPath = IndexPath(row: 0, section: 3)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        } else if nameOfButton == "Sobremesas"{
            let indexPath = IndexPath(row: 0, section: 4)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        } else if nameOfButton == "Bebidas"{
            let indexPath = IndexPath(row: 0, section: 5)
            delegate?.scrollingToTheSection(indexPath: indexPath)
        }
    }
    
    func getDatasToSearch(){
        delegate?.goToSearcView(products: productsInArray)
    }
    
    
}

extension HomeViewModel: ProductsServiceDelegate {
    
    func getDatasFromAPI(products: [ProductsModel]) {
        
        self.productsInArray = products
        
        let appetizeProductsTitle = products.filter{$0.category.title == "Entrada"}.map{$0.titleProduct}
        let appetizeProductsDescription = products.filter{$0.category.title == "Entrada"}.map{$0.description}
        let appetizeProductsPrice =  products.filter{$0.category.title == "Entrada"}.map{String(format: "%.2f", $0.price)}
        
        let mealsProductsTitle = products.filter{$0.category.title == "Carnes"}.map{$0.titleProduct}
        let mealsProductsDescription = products.filter{$0.category.title == "Carnes"}.map{$0.description}
        let mealsProductsPrice =  products.filter{$0.category.title == "Carnes"}.map{String(format: "%.2f", $0.price)}
        
        let fishProductsTitle = products.filter{$0.category.title == "Peixe"}.map{$0.titleProduct}
        let fishProductsDescription = products.filter{$0.category.title == "Peixe"}.map{$0.description}
        let fishProductsPrice =  products.filter{$0.category.title == "Peixe"}.map{String(format: "%.2f", $0.price)}
        
        let pastaProductsTitle = products.filter{$0.category.title == "Massas"}.map{$0.titleProduct}
        let pastaProductsDescription = products.filter{$0.category.title == "Massas"}.map{$0.description}
        let pastaProductsPrice =  products.filter{$0.category.title == "Massas"}.map{String(format: "%.2f", $0.price)}
        
        let dessertProductsTitle = products.filter{$0.category.title == "Sobremesas"}.map{$0.titleProduct}
        let dessertProductsDescription = products.filter{$0.category.title == "Sobremesas"}.map{$0.description}
        let dessertProductsPrice =  products.filter{$0.category.title == "Sobremesas"}.map{String(format: "%.2f", $0.price)}
        
        let drinksProductsTitle = products.filter{$0.category.title == "Bebidas"}.map{$0.titleProduct}
        let drinksProductsDescription = products.filter{$0.category.title == "Bebidas"}.map{$0.description}
        let drinksProductsPrice =  products.filter{$0.category.title == "Bebidas"}.map{String(format: "%.2f", $0.price)}
        
        appetize = AppetizerModel(title: appetizeProductsTitle, price: appetizeProductsPrice, description: appetizeProductsDescription)
        meals = MealsModel(title: mealsProductsTitle, price: mealsProductsPrice, description: mealsProductsDescription)
        fish = FishModel(title: fishProductsTitle, price: fishProductsPrice, description: fishProductsDescription)
        pasta = PastaModel(title: pastaProductsTitle, price: pastaProductsPrice, description: pastaProductsDescription)
        dessert = DessertModel(title: dessertProductsTitle, price: dessertProductsPrice, description: dessertProductsDescription)
        drinks = DrinksModel(title: drinksProductsTitle, price: drinksProductsPrice, description: drinksProductsDescription)
         
        let getTitleCategory = products.map({$0.category.title})
        titleCategoryUnique = getTitleCategory.removeDuplicates()
                
        delegate?.sendTitleCategoryUnique(titleCategoryUnique: titleCategoryUnique)
        
        }
    
}


