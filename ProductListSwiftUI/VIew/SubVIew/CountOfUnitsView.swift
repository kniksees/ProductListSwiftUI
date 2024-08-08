//
//  CountOfUnitsView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct CountOfUnitsView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel

    var body: some View {
        if viewModel.productList[id] != nil {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 36)
                    .foregroundColor(.appGreen)
                HStack {
                    Button {
                        if viewModel.productList[id]!.countUnits >= 1 {
                            viewModel.productList[id]!.countUnits -= 1
                            viewModel.updateShoppingCartProductList(id: id)
                        }
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                    }
                    Spacer()
                    VStack {
                        Text("\(viewModel.productList[id]!.countUnits) шт")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        Text(String(format: "%.2f", Double(viewModel.productList[id]!.countUnits) * (viewModel.productList[id]!.pricePerOne ?? 0)))
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                    Button {
                        viewModel.productList[id]!.countUnits += 1
                        viewModel.updateShoppingCartProductList(id: id)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                    }
                }
            }
            .frame(height: 37)
        }
    }
}

#Preview {
    CountOfUnitsView(id: 0)
        .frame(width: 300, height: 37)
}
