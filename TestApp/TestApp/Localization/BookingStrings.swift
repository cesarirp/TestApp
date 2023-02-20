//
//  BookingStrings.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import Foundation

enum BookingStrings: String, Localized {
    case min = "min"
    case deposit = "Deposit"
    case listOfBookings = "List of Bookings"
    case selectABooking = "Select a Booking"
    case duration = "Duration"
    case loading = "Loading..."
    case error = "Error"
    case retry = "Retry"
    case ok = "OK"
    case start = "Start"
    case wrongResponseMessage = "The response is not valid, please try again later."
    case malformedURLMessage = "The request could not be performed, please try again later."
}

protocol Localized {
    var localized: String { get }
}

extension Localized where Self: RawRepresentable, RawValue == String {
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
