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
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(homeViewModel)
        }
    }
}
