//
//  SaleView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct SaleView: View {
    let id: Int
    @ObservedObject var viewModel = ViewModel.viewModel
    var body: some View {
        if viewModel.productList[id] != nil && viewModel.productList[id]!.sale != nil {
            ZStack {
                Text("\(viewModel.productList[id]!.sale!)%")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundStyle(.red)
            }
            .frame(width: 40, height: 20)
        }
    }
}

#Preview {
    SaleView(id: 0)
}
