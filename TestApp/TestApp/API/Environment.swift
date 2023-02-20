//
//  Environment.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

enum Environment {
    case production
    case staging
    case development
    
    var basePath: String {
        switch self {
        default:
            return "https://appointmentrequestsapi-dev.symplast.com/"
        }
    }
}
