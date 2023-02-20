//
//  BookingListViewModel.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import Foundation

final class BookingListViewModel: ObservableObject {    
    struct State {
        var bookings: [Booking] = []
        var selectedBooking: Booking?
        
        var isLoading = true {
            didSet {
                if isLoading {
                    errorMessage = nil
                }
            }
        }
        
        var errorMessage: String? = nil {
            didSet {
                if errorMessage != nil {
                    isLoading = false
                }
            }
        }
    }

    @Published var state: State
    private let repository: any BookingRepository
    
    init(state: State = .init(),
         repository: any BookingRepository = BookingRepositoryImplementation()) {
        self.state = state
        self.repository = repository
    }
    
    enum Action {
        case loadList
    }
    
    func send(action: Action) {
        switch action {
        case .loadList:
            Task { await loadList() }
        }
    }
    
    @MainActor
    private func loadList() async {
        state.isLoading = true
        do {
            let bookings = try await repository.getElements()
            state.bookings = bookings
            state.isLoading = false
        } catch {
            state.errorMessage = error.localizedDescription
        }
    }
}
