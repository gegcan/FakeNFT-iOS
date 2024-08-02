//
//  Float+Extensions.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 20.07.2024.
//

import Foundation

extension Float {
    static let twoFractionDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var priceFormatted: String {
        let string = Float.twoFractionDigits.string(for: self) ?? ""
        let changeDotToComma = String(string.map { $0 == "." ? "," : $0 })
        let currencyCode = " ETH"
        return changeDotToComma + currencyCode
    }
}
