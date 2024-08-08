//
//  GridElementView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct GridElementView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if let product = viewModel.productList[id] {
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                VStack {
                    Image(uiImage: viewModel.getImageByURL(url: product.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 168, height: 120)
                    HStack {
                        RatingView(id: id)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        Spacer()
                        SaleView(id: id)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                    }
                    HStack {
                        Text(product.name)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    HStack {
                        Text(product.country)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            .foregroundStyle(Color(.darkGray))
                        Spacer()
                    }
                    Spacer(minLength: 0)
                    ShoppingCartView(id: id)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 3, trailing: 4))
                    
                }
                HStack {
                    VStack {
                        BannerView(id: id)
                        Spacer()
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack {
                        SaveView(id: id)
                        Spacer()
                    }
                    
                }
            }
            .frame(width: 168, height: 278)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
        }
    }
}


#Preview {
    ZStack {
        RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.gray)
        GridElementView(id: 0)
    }
}
