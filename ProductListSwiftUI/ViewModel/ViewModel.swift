//
//  ViewModel.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import Foundation

import UIKit

class ViewModel: ObservableObject {
    static var viewModel = ViewModel()
    private init() {}
    
    @Published var productList = [0: Product(id: 0,
                                             name: "сыр Ламбер 500/0 230г",
                                             pricePerOne: 99.90,
                                             pricePerKilo: 88.90,
                                             oldPricePerOne: 77.70,
                                             oldPricePerKilo: 66.60,
                                             country: "Россия 🇷🇺",
                                             rating: 4.9,
                                             bunnerType: BunnerType.blowToPrices,
                                             imageUrl: "url1",
                                             sale: 15,
                                             reviewsCount: 10)]
    
    @Published var shoppingCartProductList = Set<Int>()
    
    func getProuctList() {
        productList.removeAll()
        let nameArr = ["сыр Ламбер 500/0 230г", "Энергетический Напит", "Салат Овощной с Крабовыми Палочками"]
        let priceArr = [1234.12, 34.00, nil, nil, 99.90]
        let price1Arr = [1234.12, 34.00, 200.20, 333.33, 99.90]
        let oldPriceArr = [1234.12, 34.00, 1.10, 222.2, 99.90]
        let countryArr = ["Россия 🇷🇺", "Франция 🇫🇷", "Казахстан 🇰🇿"]
        let ratingArr = [1.1, 2.2, 3.3, 4.4, 5.0]
        let typeArr = [BunnerType.blowToPrices, BunnerType.priceAccordingToTheCard, BunnerType.newItems, nil, nil, nil]
        let saleArr = [10, 15, 25, 30, nil, nil, nil]
        let imageUrlArr = ["url1", "url2", "url3"]
        for i in 1...50 {
            let product = Product(id: i,
                                  name: nameArr.randomElement()!,
                                  pricePerOne: priceArr.randomElement()!,
                                  pricePerKilo: price1Arr.randomElement()!,
                                  oldPricePerOne: oldPriceArr.randomElement()!,
                                  oldPricePerKilo: oldPriceArr.randomElement()!,
                                  country: countryArr.randomElement()!,
                                  rating: ratingArr.randomElement()!,
                                  bunnerType: typeArr.randomElement()!,
                                  imageUrl: imageUrlArr.randomElement()!,
                                  sale: saleArr.randomElement()!,
                                  reviewsCount: Int.random(in: 0...40))
            productList[i] = product
        }
        
    }
    
    func getImageByURL(url: String) -> UIImage {
        let storage = ["url1": UIImage(named: "TypeFood1"),
                       "url2": UIImage(named: "TypeFood2"),
                       "url3": UIImage(named: "TypeFood3")
                       
        ]
        return (storage[url] ?? UIImage()) ?? UIImage()
    }
    
    func updateShoppingCartProductList(id: Int) {
        if productList[id] != nil {
            shoppingCartProductList.insert(id)
            if productList[id]!.countKilo == 0 && productList[id]!.countUnits == 0 {
                shoppingCartProductList.remove(id)
            }
        }
    }
}
