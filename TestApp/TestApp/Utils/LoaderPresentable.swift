//
//  LoaderPresentable.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import SwiftUI

protocol LoaderPresentable: View {
    associatedtype Content: View
    associatedtype Loader: View
    
    var isLoading: Bool { get }
    
    @ViewBuilder var loader: Self.Loader { get }
    @ViewBuilder var content: Self.Content { get }
}

extension LoaderPresentable {
    var body: some View {
        ZStack {
            content
                .blur(radius: isLoading ? 4 : 0.001)
                .allowsHitTesting(!isLoading)
                .ignoresSafeArea()
                .animation(.easeOut, value: isLoading)
            loader
                .opacity(isLoading ? 1 : 0 )
                .animation(.easeOut, value: isLoading)
        }
    }
    
    var loader: some View {
        LoaderView()
    }
}
