//
//  HTTPClient.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

protocol URLRequestConvertible {
    func request(with baseURL: URL) -> URLRequest
}

protocol NetworkClient {
    func request<T: Decodable>(request: URLRequestConvertible) async throws -> Response<T>
}

final class HTTPClient: NetworkClient {
    private let environment: Environment
    
    init(environment: Environment = .development) {
        self.environment = environment
    }
    
    func request<T: Decodable>(request: URLRequestConvertible) async throws -> Response<T> {
        guard let baseURL = URL(string: environment.basePath) else {
            throw NetworkError.malformedURL
        }
        
        let (data, response) = try await URLSession.shared.data(for: request.request(with: baseURL))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.wrongResponse
        }
        return try JSONDecoder().decode(Response<T>.self, from: data)
    }
}
