//
//  OnboardingScreen.swift
//  Fructus
//
//  Created by Tonmoy on 3/4/23.
//

import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        TabView{
            ForEach(0..<5){ index in
                FruitCard(fruit: fruits[index])
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
