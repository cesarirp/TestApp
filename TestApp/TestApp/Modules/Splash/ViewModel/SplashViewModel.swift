//
//  SplashViewModel.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import Foundation

final class SplashViewModel: ObservableObject {
    struct State {
        var startAnimation = false
        var showNextScreen = false
    }
    
    @Published var state: State
    
    init(state: State = .init()) {
        self.state = state
    }
    
    enum Action {
        case startAnimation
        case showNextScreen
    }
    
    func send(action: Action) {
        switch action {
        case .startAnimation:
            startAnimation()
        case .showNextScreen:
            showNextScreen()
        }
    }
    
    private func startAnimation() {
        state.startAnimation = true
    }
    
    private func showNextScreen() {
        state.showNextScreen = true
    }
}
