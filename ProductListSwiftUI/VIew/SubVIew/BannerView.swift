//
//  BannerView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct BannerView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    
    var body: some View {
        if viewModel.productList[id] != nil {
            switch viewModel.productList[id]!.bunnerType {
            case .blowToPrices:
                ZStack {
                    Rectangle()
                        .frame(width: 84, height: 16)
                        .foregroundColor(.blowToPrices)
                        .clipShape(RoundedCornerShape(radius: 6, corners: [.topRight, .bottomRight]))
                    Text("Удар по ценам")
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading:  5, bottom: 0, trailing: 0))
                }
            case .newItems:
                ZStack {
                    Rectangle()
                        .frame(width: 57, height: 16)
                        .foregroundColor(.newItems)
                        .clipShape(RoundedCornerShape(radius: 6, corners: [.topRight, .bottomRight]))
                    Text("Новинки")
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading:  5, bottom: 0, trailing: 0))
                }
            case .priceAccordingToTheCard:
                ZStack {
                    Rectangle()
                        .frame(width: 81, height: 16)
                        .foregroundColor(.priceAccordingToTheCard)
                        .clipShape(RoundedCornerShape(radius: 6, corners: [.topRight, .bottomRight]))
                    Text("Цена по карте")
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading:  5, bottom: 0, trailing: 0))
                }
            case nil:
                VStack{}
            }
        }
    }
}

struct RoundedCornerShape: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    VStack {
        BannerView(id: 0)
//        BannerView(type: .newItems)
//        BannerView(type: .priceAccordingToTheCard)
    }
}
