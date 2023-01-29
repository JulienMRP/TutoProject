//
//  SplashScreenView.swift
//  TutoProject
//
//  Created by Perso on 1/29/23.
//

import SwiftUI

struct SplashView: View {
    @State var shouldDisplaySplashView:Bool = true
    var body: some View {
        HStack {
            if self.shouldDisplaySplashView {
                SplashContent()
            } else {
                ContentView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.shouldDisplaySplashView = false
                }
            }
        }
    }
}

struct SplashContent: View {

    @State private var animation = false
        
    private var image: some View {
        Image("steering-wheel")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .rotationEffect(animation ? Angle(degrees: 900) : Angle(degrees: 0))
    }

    private let animationTimer = Timer
        .publish(every: 1.5, on: .current, in: .common)
            .autoconnect()
    
    private func launchAnimation() { // Mark 5
            withAnimation(.easeInOut(duration: 1)) {
                animation.toggle()
            }
    }
        
    var body: some View {
           ZStack {
               image
           }.onReceive(animationTimer) { timerValue in
               launchAnimation()
           }.opacity(animation ? 0 : 1)
       }
}





