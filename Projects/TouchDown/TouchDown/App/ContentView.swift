//
//  ContentView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing : 0) {
                CustomNavbar()
                
                Spacer()
                
                FooterView()
                    .padding(.horizontal)
            }
            .background(colorBackground.edgesIgnoringSafeArea(.all))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
