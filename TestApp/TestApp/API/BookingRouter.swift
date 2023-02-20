//
//  BookingRouter.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

enum BookingRouter: Router {
    case listBookings
    
    var path: String {
        switch self {
        case .listBookings:
            return "AppointmentTypesPurposes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listBookings:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .listBookings:
            return ["tenantId": "1007"]
        }
    }
}
