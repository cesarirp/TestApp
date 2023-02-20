//
//  NetworkError.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

enum NetworkError: Error {
    case malformedURL
    case wrongResponse
    
    var localizedDescription: String {
        switch self {
        case .malformedURL:
            return BookingStrings.malformedURLMessage.localized
        case .wrongResponse:
            return BookingStrings.wrongResponseMessage.localized
        }
    }
}
