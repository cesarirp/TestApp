//
//  BookingResponse.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

struct BookingResponse: Codable {
    let id: Int
    let durationInMinutes: Int
    let overrideName: String
    let bookingDeposit: Double
    let appointmentTypeId: Int
    let appointmentPurposeId: Int
}
