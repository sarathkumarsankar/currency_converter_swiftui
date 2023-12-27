//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 25/12/2023.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var lefAmountField = ""
    @State var rightAmountField = ""
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftCurrency: Currency = .goldPiece
    @State var rightCurrency: Currency = .goldPenny
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var currencyConverterTipView = CurrencyConverterTipView()

    
    var body: some View {
        // backgroud image
        ZStack {
            // entire view
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Log image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Title text
                Text("Currency Exchange")
                    .font(.title)
                    .foregroundColor(.white)
                // Coverter
                HStack {
                    // title and icon
                    VStack {
                        HStack {
                            // Currency icon
                            // currency name
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .popoverTip(currencyConverterTipView)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        //Amount textfield
                        TextField("Amount", text: $lefAmountField)
                            .background(.white)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .focused($leftTyping)
                        
                    }
                    // equal sign
                    Image(systemName: "equal")
                        .font(.title)
                        .foregroundColor(.white)
                        .symbolVariant(.rectangle)
                    
                    VStack {
                        HStack {
                            // Currency icon
                            // currency name
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        //Amount textfield
                        TextField("Amount", text: $rightAmountField)
                            .background(.white)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($rightTyping)
                        
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(Capsule())
                
                
                Spacer()
                // Info icon
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .frame(height: 33)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(.trailing, 10)
                }
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(slectedTopCurrency: $leftCurrency, slectedBottomCurrency: $rightCurrency)
            }
            .onChange(of: leftCurrency, { oldValue, newValue in
                rightAmountField = leftCurrency.covert(lefAmountField, to: rightCurrency)
            })
            
            .onChange(of: rightCurrency, { oldValue, newValue in
                lefAmountField = rightCurrency.covert(rightAmountField, to: leftCurrency)
            })
            .onChange(of: lefAmountField, { oldValue, newValue in
                if leftTyping {
                    rightAmountField = leftCurrency.covert(newValue, to: rightCurrency)
                }
            })
            .onChange(of: rightAmountField, { oldValue, newValue in
                if rightTyping {
                    lefAmountField = rightCurrency.covert(newValue, to: leftCurrency)
                }
            })
        }
        .task {
            try? Tips.configure([.displayFrequency(.weekly)])
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
