//
//  Router.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

enum HTTPMethod: String {
    case get, post, delete, put, update
}

protocol Router: URLRequestConvertible {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
}

extension Router {
    func request(with baseURL: URL) -> URLRequest {
        var url = baseURL.appendingPathComponent(path)
        if let parameters = parameters, method == .get {
            url = url.appending(queryItems: parameters.map {
                URLQueryItem(name: $0, value: $1)
            })
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
}
