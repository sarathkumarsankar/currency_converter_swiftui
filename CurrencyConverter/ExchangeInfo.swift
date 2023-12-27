//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 26/12/2023.
//

import SwiftUI


struct ExchangeInfo: View {
    @State var lefAmountField = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        // backgroud image
        ZStack {
            // Background image
            Image("parchment")
                .resizable()
                .background(.brown)
                .ignoresSafeArea()
            VStack {
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    
                // Description
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding(14)
                // Exchange rates
                VStack {
                    ExcahngeInfoView(leftIcon: "silverpenny", text: "1 Gold Piece = 4 Gold Pennies", rightIcon: "goldpenny")
                    ExcahngeInfoView(leftIcon: "silverpenny", text: "1 Gold Piece = 4 Gold Pennies", rightIcon: "goldpenny")
                    ExcahngeInfoView(leftIcon: "silverpenny", text: "1 Gold Piece = 4 Gold Pennies", rightIcon: "goldpenny")
                    ExcahngeInfoView(leftIcon: "silverpenny", text: "1 Gold Piece = 4 Gold Pennies", rightIcon: "goldpenny")
                }
                Button("Done") {
                    dismiss()
                }.background(.brown)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                // Done button
            }
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}

struct ExcahngeInfoView: View {
    let leftIcon: String
    let text: String
    let rightIcon: String

    var body: some View {
        HStack {
            //icon // Text // icon
            Image(leftIcon)
                .resizable()
                .frame(width: 33, height: 33)
            
            Text(text)
            Image(rightIcon)
                .resizable()
                .frame(width: 33, height: 33)
        }
    }
}
