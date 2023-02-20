//
//  Response.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

struct Response<T: Codable>: Codable {
    let result: T
    let statusCode: Int
    let version: String
}
