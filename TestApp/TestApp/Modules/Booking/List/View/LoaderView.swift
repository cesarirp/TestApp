//
//  LoaderView.swift
//  TestApp
//
//  Created by Andres Rodriguez on 19/02/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack(spacing: 15) {
            ProgressView()
                .scaleEffect(1.5, anchor: .center)
            Text(BookingStrings.loading.localized)
                .font(.title3)
        }
        .padding(30)
        .background(.thickMaterial)
        .cornerRadius(10)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
