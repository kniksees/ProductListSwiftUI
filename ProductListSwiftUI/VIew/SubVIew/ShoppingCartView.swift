//
//   ShoppingCartView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct ShoppingCartView: View {
    @State var selectedType: String = ""
    let types = ["Шт", "Кг"]
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if viewModel.productList[id] != nil {
            VStack {
                if viewModel.productList[id]!.pricePerKilo != nil && viewModel.productList[id]!.pricePerOne != nil {
                    Picker("Planet", selection: $selectedType) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    //.frame(width: 160)
                }
                if viewModel.productList[id]!.isSelected {
                    if selectedType == "Шт" && viewModel.productList[id]!.pricePerOne != nil {
                        CountOfUnitsView(id: id)
                    } else if selectedType == "Кг" && viewModel.productList[id]!.pricePerKilo != nil {
                        CountOfKiloView(id: id)
                    }
                } else {
                    HStack {
                        VStack {
                            if viewModel.productList[id]!.pricePerKilo != nil && viewModel.productList[id]!.pricePerOne != nil {
                                if selectedType == "Шт" {
                                    PriceView(price: viewModel.productList[id]!.pricePerOne!, oldPrice: viewModel.productList[id]!.oldPricePerOne, type: "Шт")
                                } else if selectedType == "Кг"  {
                                    PriceView(price: viewModel.productList[id]!.pricePerKilo!, oldPrice:  viewModel.productList[id]!.oldPricePerKilo, type: "Кг")
                                }
                            } else if viewModel.productList[id]!.pricePerKilo != nil {
                                PriceView(price: viewModel.productList[id]!.pricePerKilo!, oldPrice: viewModel.productList[id]!.oldPricePerKilo, type: "Кг")
                            } else if viewModel.productList[id]!.pricePerOne != nil {
                                PriceView(price: viewModel.productList[id]!.pricePerOne!, oldPrice: viewModel.productList[id]!.oldPricePerOne, type: "Шт")
                            }
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
                        
                        Button(action: {
                            if selectedType == "Шт" {
                                viewModel.productList[id]!.countUnits += 1
                            } else {
                                viewModel.productList[id]!.countKilo += 1
                            }
                            viewModel.productList[id]!.isSelected.toggle()
                            viewModel.updateShoppingCartProductList(id: id)
                            
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                                    .frame(width: 48, height: 36)
                                    .foregroundStyle(.appGreen)
                                Image(uiImage: UIImage(named: "ShoppingCart") ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 14, height: 14)
                            }
                        })
                    }
                    //.frame(width: 160)
                }
            }
            .onAppear() {
                selectedType = viewModel.productList[id]!.pricePerOne == nil ? "Кг" : "Шт"
            }
        }
    }
}

#Preview {
    ShoppingCartView(id: 0)
        .frame(width: 190)
}
