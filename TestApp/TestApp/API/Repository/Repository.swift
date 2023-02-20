//
//  Repository.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

protocol Repository<T> {
    associatedtype T
    func getElements() async throws -> [T]
}
