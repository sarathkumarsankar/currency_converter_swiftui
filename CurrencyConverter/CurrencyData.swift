//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by sa20199164 on 27/12/2023.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }

    var image: String {
        switch self {
        case .copperPenny:
            return "copperpenny"
        case .silverPenny:
            return "silverpenny"
        case .silverPiece:
            return "silverpiece"
        case .goldPenny:
            return "goldpenny"
        case .goldPiece:
            return "goldpiece"
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            return "Copper penny"
        case .silverPenny:
            return "Silver penny"
        case .silverPiece:
            return "Silver piece"
        case .goldPenny:
            return "Gold penny"
        case .goldPiece:
            return "Gold piece"
        }
    }
    
    func covert(_ amount: String, to currency: Currency) -> String {
        guard let doubleAmmaount = Double(amount) else {
            return ""
        }
        let convertedAmount = (doubleAmmaount / self.rawValue) * currency.rawValue
        return String(format:"%.2f", convertedAmount)
    }
}
