//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World! How are you? What are you doing nowadays!")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(hue: 1.0, saturation: 0.812, brightness: 0.26))
//            .underline(true, color: Color.blue)
//            .strikethrough(true, color: Color.accentColor)
            .multilineTextAlignment(TextAlignment.center)
            .baselineOffset(20)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
