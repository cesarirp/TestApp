//
//  BookingListView.swift
//  TestApp
//
//  Created by Andres Rodriguez on 17/02/23.
//

import SwiftUI

struct BookingListView: LoaderPresentable {
    var isLoading: Bool { viewModel.state.isLoading }
    @StateObject var viewModel = BookingListViewModel()
    
    var content: some View {
        NavigationSplitView {
            List(viewModel.state.bookings, selection: $viewModel.state.selectedBooking) { booking in
                NavigationLink {
                    detail(with: booking)
                } label: {
                    
#if targetEnvironment(macCatalyst)
                    BookingRowView(booking: booking)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
#else
                    BookingRowView(booking: booking)
#endif
                }
            }
            .refreshable {
                viewModel.send(action: .loadList)
            }
            .navigationTitle(BookingStrings.listOfBookings.localized)
            .toolbar {
#if targetEnvironment(macCatalyst)
                Button(action: {
                    viewModel.send(action: .loadList)
                }) {
                    HStack {
                        Image(systemName: "arrow.2.circlepath")
                    }.padding(10.0)
                }
#endif
            }
        } detail: {
            if let booking = viewModel.state.selectedBooking {
                detail(with: booking)
            } else {
                Text(BookingStrings.selectABooking.localized)
            }
        }
        .onAppear {
            viewModel.send(action: .loadList)
        }
        .showAlert(with: $viewModel.state.errorMessage) {
            viewModel.send(action: .loadList)
        }
    }
    
    private func detail(with booking: Booking) -> some View {
        BookingDetailView(
            viewModel: .init(
                state: .init(booking: booking)
            )
        )
    }
}

struct BookingListView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = [
            Booking(id: 0, duration: 1, name: "Booking 1", deposit: 10),
            Booking(id: 1, duration: 1, name: "Booking 2", deposit: 10),
            Booking(id: 2, duration: 1, name: "Booking 3", deposit: 10)]
        BookingListView(
            viewModel: BookingListViewModel(
                state: .init(bookings: dummyData)
            )
        )
    }
}
