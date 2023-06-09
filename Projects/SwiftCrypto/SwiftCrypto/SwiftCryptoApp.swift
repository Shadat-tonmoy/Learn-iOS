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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path : $navigationPaths.paths) {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(homeViewModel)
            .environmentObject(navigationPaths)
        }
    }
}
