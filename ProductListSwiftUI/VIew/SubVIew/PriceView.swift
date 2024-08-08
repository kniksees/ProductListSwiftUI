//
//  PriceView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct PriceView: View {
    let price: Double
    let oldPrice: Double?
    let type: String
    var body: some View {
        let price = String(format: "%.2f", price).split(separator: ".")
        HStack {
            Text(price[0])
                .font(.system(size: 20))
            Text(price[1])
                .padding(EdgeInsets(top: 0, leading: -4, bottom: 0, trailing: 0))
            if type == "Шт" {
                RublesPerOneView()
                    .padding(EdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 0))
            } else {
                RublesPerKiloView()
                    .padding(EdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 0))
            }
               
            Spacer()
        }
        if oldPrice != nil {
            HStack {
                Text(String(format: "%.2f", oldPrice!))
                    .font(.system(size: 12))
                    .foregroundStyle(Color(.darkGray))
                    .strikethrough()
                    .padding(EdgeInsets(top: -15, leading: 2, bottom: 0, trailing: 0))
                Spacer()
            }
          
        }
    }
}

#Preview {
    VStack {
        PriceView(price: 99.90, oldPrice: 90, type: "Шт")
        PriceView(price: 99.90, oldPrice: 90, type: "Кг")
    }
}
