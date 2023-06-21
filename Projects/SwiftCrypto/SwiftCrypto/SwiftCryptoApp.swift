//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    
    @StateObject private var homeViewModel : HomeViewModel = HomeViewModel()
    @StateObject private var navigationPaths : NavigationPaths = NavigationPaths()
    @State private var showLaunchView : Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path : $navigationPaths.paths) {
                ZStack {
                    HomeView()
                        .toolbar(.hidden)
                    
                    if showLaunchView {
                        LaunchScreenView(show: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                    
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                    withAnimation(.easeOut(duration: 2.0)) {
                        showLaunchView.toggle()
                    }
                    
                    
                })
            }
            .environmentObject(homeViewModel)
            .environmentObject(navigationPaths)
        }
    }
}
