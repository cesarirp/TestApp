//
//  BookingRouter.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

enum BookingRouter: String, Router, URLRequestConvertible {
    case listBookings
    
    var path: String {
        switch self {
        case .listBookings:
            return "AppointmentTypesPurposes?tenantId=1007"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .listBookings:
            return .get
        }
    }
}
