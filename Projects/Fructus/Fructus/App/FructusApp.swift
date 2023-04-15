//
//  FructusApp.swift
//  Fructus
//
//  Created by Tonmoy on 2/4/23.
//

import SwiftUI

@main
struct FructusApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingScreen()
            } else {
                ContentView()
            }
            
        }
    }
}
