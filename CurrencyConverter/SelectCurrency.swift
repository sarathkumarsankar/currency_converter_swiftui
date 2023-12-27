//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 27/12/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var slectedTopCurrency: Currency
    @Binding var slectedBottomCurrency: Currency
    
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                // top GridView
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        if slectedTopCurrency == currency {
                            GridView(image: currency.image, name: currency.name)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .shadow(radius: 10)
                                .onTapGesture {
                                    slectedTopCurrency = currency
                                }
                            
                        } else {
                            GridView(image: currency.image, name: currency.name)
                                .onTapGesture {
                                    slectedTopCurrency = currency
                                }
                        }
                    }
                    
                }
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // bottom GridView
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        
                        if slectedBottomCurrency == currency {
                            GridView(image: currency.image, name: currency.name)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .shadow(radius: 10)
                                .onTapGesture {
                                    slectedBottomCurrency = currency
                                }
                            
                        } else {
                            GridView(image: currency.image, name: currency.name)
                                .onTapGesture {
                                    slectedBottomCurrency = currency
                                }
                        }
                    }
                }
                
                Button("Done") {
                    dismiss()
                }.background(.brown)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .buttonStyle(.bordered)
            }.padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(slectedTopCurrency: .constant(.goldPiece), slectedBottomCurrency: .constant(.goldPiece))
    }
}

