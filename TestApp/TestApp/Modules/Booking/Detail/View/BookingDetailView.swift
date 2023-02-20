//
//  BookingDetailView.swift
//  TestApp
//
//  Created by Andres Rodriguez on 19/02/23.
//

import SwiftUI

struct BookingDetailView: View {
    let viewModel: BookingDetailViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.state.booking.name)
                .padding()
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            Spacer()
                .frame(height: 20)
            HStack {
                Spacer()
                VStack {
                    Text(BookingStrings.duration.localized)
                        .foregroundColor(.secondary)
                        .fontWeight(.thin)
                    Text(viewModel.state.booking.durationFormatted)
                }
                Spacer()
                VStack {
                    Text(BookingStrings.deposit.localized)
                        .foregroundColor(.secondary)
                        .fontWeight(.thin)
                    Text(viewModel.state.booking.depositFormatted())
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(
            viewModel: .init(
                state: .init(
                    booking: Booking(id: 0,
                                     duration: 10,
                                     name: "Some name",
                                     deposit: 10)
                )
            )
        )
    }
}
