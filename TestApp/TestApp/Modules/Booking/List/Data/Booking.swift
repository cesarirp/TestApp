//
//  Booking.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

struct Booking: Identifiable, Hashable {
    let id: Int
    let duration: Int
    let name: String
    let deposit: Double
}

extension Booking {
    var durationFormatted: String {
        "\(duration) \(BookingStrings.min.localized)"
    }
    
    func depositFormatted(addPrefix: Bool = false) -> String {
        let prefix = addPrefix ? "\(BookingStrings.deposit.localized): " : ""
        return prefix + FormatterHelper.shared.currency(from: deposit)
    }
}
