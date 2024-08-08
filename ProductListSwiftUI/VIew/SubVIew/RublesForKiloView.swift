//
//  RublesForKiloView.swift
//  ProductListSwiftUI
//
//  Created by Dmitry Erofeev on 07.08.2024.
//

import SwiftUI

struct RublesPerKiloView: View {
    var body: some View {
        ZStack {
            HStack {
                
                VStack {
                    Text("₽")
                        .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                        .font(.system(size: 13))
                    Spacer()
                }
                Spacer()
            }
            Rectangle()
                .frame(width: 20, height: 1)
            .rotationEffect(Angle(degrees: -45))
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("кг")
                        .font(.system(size: 11))
                    
                }
                
            }
        }
        .frame(width: 24, height: 25)
        
    }
}

#Preview {
    RublesPerKiloView()
}
