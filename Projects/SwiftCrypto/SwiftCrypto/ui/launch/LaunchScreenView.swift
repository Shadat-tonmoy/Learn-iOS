//
//  LaunchScreenView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/21/23.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var loadingText : [String] = "Loading! Please wait...".map { String($0) }
    @State private var showLoadingText = false
    @State private var counter = 0
    @State private var loop = 0
    @Binding var show : Bool
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launchTheme.background
                .ignoresSafeArea()
            
            VStack {
                Image("logo-transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                if showLoadingText {
                    
                    HStack(spacing : 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.launchTheme.accent)
                                .offset(y : counter == index ? -5 : 0)
                                
//                                .transition(AnyTransition.scale.animation(.easeIn))
                            
                            
                        }
                    }
                    
                }
                
                
            }
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                
                let lastIndex = loadingText.count - 1
                
                if counter == lastIndex {
                    counter = 0
                    loop += 1
                } else {
                    counter += 1
                }
                
                if loop == 2 {
                    show = false
                }
            }
            
            
        })
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(show: .constant(true))
    }
}
