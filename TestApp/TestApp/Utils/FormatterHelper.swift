//
//  FormatterHelper.swift
//  TestApp
//
//  Created by Andres Rodriguez on 19/02/23.
//

import Foundation

final class FormatterHelper {
    static let shared = FormatterHelper()
    
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = Locale.current.currencySymbol
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private init() { }
    
    func currency(from value: Double) -> String {
        formatter.string(from: value as NSNumber) ??
         String(format: "$%.02f", value)
    }
}
