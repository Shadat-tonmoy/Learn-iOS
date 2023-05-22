//
//  ContentView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:20){
                Text("AccentColor")
                    .foregroundColor(.theme.accent)
                
                Text("GreenColor")
                    .foregroundColor(.theme.green)
                
                Text("RedColor")
                    .foregroundColor(.theme.red)
                
                Text("SecondaryTextColor")
                    .foregroundColor(.theme.secondaryText)
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
