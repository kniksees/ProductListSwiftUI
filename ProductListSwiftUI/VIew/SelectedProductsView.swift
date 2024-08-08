//
//  SelectedProductsView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 09.08.2024.
//

import SwiftUI

struct SelectedProductsView: View {
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach([Int](ViewModel.viewModel.shoppingCartProductList), id: \.self) { el in
                    ListElementView(id: el)
                    Divider()
                }
            }
        }
    }
}

#Preview {
    SelectedProductsView()
}
