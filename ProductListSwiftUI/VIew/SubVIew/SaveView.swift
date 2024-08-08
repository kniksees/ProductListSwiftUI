//
//  SaveView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct SaveView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if viewModel.productList[id] != nil {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
                VStack {
                    Button(action: {
                        viewModel.productList[id]!.isInOrderList.toggle()
                    }, label: {
                        if viewModel.productList[id]!.isInOrderList {
                            Image(uiImage: UIImage(named: "OrderList") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.green)
                            
                        } else {
                            Image(uiImage: UIImage(named: "OrderList") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(Color(.darkGray))
                        }
                        
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                    Button(action: {
                        viewModel.productList[id]!.isInFavorites.toggle()
                    }, label: {
                        if viewModel.productList[id]!.isInFavorites {
                            Image(uiImage: UIImage(named: "HeartFill") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.green)
                        } else {
                            Image(uiImage: UIImage(named: "Heart") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(Color(.darkGray))
                        }
                    })
                    
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                    
                }
            }
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16)))
            .frame(width: 32, height: 64)
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
            .foregroundStyle(.black)
        SaveView(id: 0)
    }
}
