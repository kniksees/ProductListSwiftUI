//
//  ContentView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isList = false
    @ObservedObject var viewModel = ViewModel.viewModel
    @State private var isFirstAppear = true
    var body: some View {
        NavigationStack {
            HStack {
                Button(action: {
                    
                    isList.toggle()
                }, label: {
                    if isList {
                        Image(uiImage: UIImage(named: "ListImage") ?? UIImage())
                            .resizable()
                            .frame(width: 40, height: 40)
                    } else {
                        Image(uiImage: UIImage(named: "GridImage") ?? UIImage())
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                })
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 7, trailing: 0))
                Spacer()
                NavigationLink {
                    SelectedProductsView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.appGreen)
                        Image(uiImage: UIImage(named: "ShoppingCart") ?? UIImage())
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
                Button(action: {
                    
                    isList.toggle()
                }, label: {
                    
                    
                })
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
            }
            
            .onAppear() {
                if isFirstAppear {
                    viewModel.getProuctList()
                    isFirstAppear = false
                }
            }
            Divider()
            if isList {
                ScrollView {
                    VStack {
                        ForEach([Int](viewModel.productList.keys), id: \.self) { el in
                            ListElementView(id: el)
                            Divider()
                        }
                    }
                }
            } else {
                ScrollView {
                    VStack {
                        Spacer(minLength: 5)
                        LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))], spacing: 10, content: {
                            
                            ForEach([Int](viewModel.productList.keys), id: \.self) { el in
                                GridElementView(id: el)
                                    .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255), radius: 4)
                                
                            }
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
