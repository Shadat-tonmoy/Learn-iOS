//
//  ContentView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            FooterView()
                .padding(.horizontal)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
