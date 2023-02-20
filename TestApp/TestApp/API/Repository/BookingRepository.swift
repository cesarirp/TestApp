//
//  BookingRepository.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

protocol BookingRepository: Repository<Booking> { }

final class BookingRepositoryImplementation: BookingRepository {
    let client: NetworkClient
    
    init(client: NetworkClient = HTTPClient()) {
        self.client = client
    }
    
    func getElements() async throws -> [Booking] {
        return try await getElementsFromServer()
    }
    
    private func getElementsFromServer() async throws -> [Booking] {
        let response: Response<[BookingResponse]> =
        try await client.request(request: BookingRouter.listBookings)
        
        return response.result.map {
            return Booking(id: $0.id,
                           duration: $0.durationInMinutes,
                           name: $0.overrideName,
                           deposit: $0.bookingDeposit)
        }
    }
}
