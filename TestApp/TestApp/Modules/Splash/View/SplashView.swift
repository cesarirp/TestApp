//
//  SplashView.swift
//  TestApp
//
//  Created by Andres Rodriguez on 18/02/23.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel = .init()
    @State private var makeLettersSquares = true
    @State private var hideOneLetter = true
    @State private var rotate = true
    @State private var scale = true
    @State private var fillScreen = true
    @State private var hideName = true
    
    var body: some View {
        ZStack {
            InitialsView(makeLettersSquares: $makeLettersSquares,
                         hideOneLetter: $hideOneLetter)
            .scaleEffect(fillScreen ? 10 : 1)
            .scaleEffect(scale ? 1.2 : 1)
            .rotation3DEffect(Angle(radians: !rotate ? 0 : .pi),
                              axis: (x: 1, y: 0, z: 0))
            .onChange(of: viewModel.state.startAnimation, perform: { newValue in
                guard newValue else { return }
                
                withAnimation(.spring()) {
                    fillScreen.toggle()
                }
                
                withAnimation(.spring().delay(0.3)) {
                    scale.toggle()
                    makeLettersSquares.toggle()
                }
                
                withAnimation(.spring().delay(0.6)) {
                    rotate.toggle()
                }
                
                withAnimation(.spring().delay(0.8)) {
                    hideOneLetter.toggle()
                }
                
                withAnimation(.easeIn.delay(1.0)) {
                    hideName.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        viewModel.send(action: .showNextScreen)
                    }
                }
            })
            .onAppear {
                viewModel.send(action: .startAnimation)
            }
            
            Text("Cesar Rodriguez")
                .opacity(hideName ? 0 : 1)
                .fontWeight(.ultraLight)
                .offset(y: 70)
                .fullScreenCover(isPresented: $viewModel.state.showNextScreen) {
                    BookingListView()
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

private struct InitialsView: View {
    @Binding var makeLettersSquares: Bool
    @Binding var hideOneLetter: Bool
    
    var body: some View {
        HStack {
            CLetter(fill: makeLettersSquares)
                .fill(.teal)
                .frame(width: hideOneLetter ? 200 : 100, height: 100)
            RLetter(fill: makeLettersSquares)
                .fill(.red)
                .frame(width: makeLettersSquares ? 0 : 100, height: 100)
                .opacity(hideOneLetter ? 0 : 1)
        }
    }
}
