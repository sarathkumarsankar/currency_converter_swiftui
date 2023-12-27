//
//  GridView.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 27/12/2023.
//

import SwiftUI

struct GridView: View {
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .overlay(alignment: .bottom) {
                    Text(name)
                        .font(.caption)
                        .background(.brown)
                }
                .padding(2)
        }
        .frame(width: 100, height: 100)
        .background(.brown.opacity(0.8))
        .cornerRadius(20)
    }
}
