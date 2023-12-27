//
//  TipView.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 27/12/2023.
//

import SwiftUI
import TipKit

struct CurrencyConverterTipView: Tip {
    var title: Text = Text("Change currency")
    
    var message: Text? {
        Text("You can tap left and right currency to bring up the selected currency screen")
    }
    
        var image: Image? {
        Image(systemName: "sterlingsign.arrow.circlepath")
    }
}

