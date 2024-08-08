//
//  Model.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import Foundation

struct Product {
    var id: Int
    var name: String
    var pricePerOne: Double?
    var pricePerKilo: Double?
    var oldPricePerOne: Double?
    var oldPricePerKilo: Double?
    var country: String
    var rating: Double
    var bunnerType: BunnerType?
    var imageUrl: String
    var sale: Int?
    var countKilo: Int = 0
    var countUnits: Int = 0
    var isSelected: Bool = false 
    var isInOrderList: Bool = false 
    var isInFavorites: Bool = false 
    var reviewsCount: Int 
}

enum BunnerType {
    case blowToPrices
    case newItems
    case priceAccordingToTheCard
}
