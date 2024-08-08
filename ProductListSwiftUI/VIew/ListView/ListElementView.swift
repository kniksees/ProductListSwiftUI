//
//  ListElementView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 09.08.2024.
//

import SwiftUI

struct ListElementView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if let product = viewModel.productList[id] {
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                HStack {
                    VStack {
                        ZStack {
                            Image(uiImage: viewModel.getImageByURL(url: product.imageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
                                    Spacer()
                                    SaleView(id: id)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        .frame(width: 144, height: 144)
                    }
                    Spacer(minLength: 15)
                    VStack {
                        HStack {
                            VStack {
                                HStack(spacing: 4) {
                                    RatingView(id: id)
                                    Rectangle()
                                        .frame(width: 0.5, height: 14)
                                        .foregroundStyle(Color(.darkGray))
                                    Text("\(viewModel.productList[id]!.reviewsCount) отзывов")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.darkGray))
                                    Spacer()
                                }
                                HStack {
                                    Text(product.name)
                                        .font(.system(size: 12))
                                    
                                    
                                    Spacer()
                                }
                                HStack {
                                    Text(product.country)
                                        .font(.system(size: 12))
                                    
                                        .foregroundStyle(Color(.darkGray))
                                    Spacer()
                                }
                            }
                            SaveView(id: id)
                        }
                        Spacer()
                        ShoppingCartView(id: id)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4 , trailing: 8))
                    }
                }

                //
                //                HStack {
                //                    Spacer()
                //                    VStack {
                //                        SaveView(id: id)
                //                        Spacer()
                //                    }
                //
                //                }
            }
            .frame(width: 360, height: 144)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
            .foregroundStyle(.gray)
        ListElementView(id: 0)
    }
    
}
