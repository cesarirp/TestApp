//
//  BookingRowView.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import SwiftUI

struct BookingRowView: View {
    let booking: Booking
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(booking.name)
                Text(booking.depositFormatted(addPrefix: true))
                    .foregroundColor(.primary)
                    .fontWeight(.thin)
            }
            Spacer(minLength: 30)
            Text(booking.durationFormatted.uppercased())
                .font(.caption)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
        }
    }
}
