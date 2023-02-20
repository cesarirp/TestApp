//
//  AlertPresentable.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import SwiftUI

extension View {
    func showAlert(with error: Binding<String?>,
                   retry: (()->())?) -> some View {
        alert(BookingStrings.error.localized,
              isPresented: .constant(error.wrappedValue != nil)) {
            if let retry {
                Button(BookingStrings.retry.localized) { retry() }
            }
            
            Button(BookingStrings.ok.localized) { }
        } message: {
            Text(error.wrappedValue ?? "")
        }
    }
}
