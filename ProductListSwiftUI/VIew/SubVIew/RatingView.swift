//
//  RatingView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct RatingView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if viewModel.productList[id] != nil {
            HStack {
                Image(uiImage: UIImage(named: "Star") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                Text(String(format: "%.1f", viewModel.productList[id]!.rating))
                    .foregroundStyle(.black)
                    .font(.system(size: 12))
            }
        }
    }
}

#Preview {
    RatingView(id: 0)
}
