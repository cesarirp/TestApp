//
//  BookingDetailViewModel.swift
//  TestApp
//
//  Created by Andres Rodriguez on 19/02/23.
//

import Foundation

final class BookingDetailViewModel: ObservableObject {
    struct State {
        let booking: Booking
    }

    @Published var state: State
    
    init(state: State) {
        self.state = state
    }    
}
