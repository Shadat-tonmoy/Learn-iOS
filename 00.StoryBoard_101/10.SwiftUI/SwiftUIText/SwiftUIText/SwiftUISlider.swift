//
//  SwiftUISlider.swift
//  SwiftUIText
//
//  Created by Tonmoy on 29/3/23.
//

import SwiftUI

struct SwiftUISlider: View {
    @State var sliderValue = 1.0
    var body: some View {
        HStack {
           VStack {
               
               Text("Slider value : \(String(format: "%.0f", sliderValue))")
                Slider(value: $sliderValue,
                       in: 1...100,
                       step: 1.0)
                .accentColor(.purple)
                .tint(.purple)
                
            }
            
            
        }
    }
}

struct SwiftUISlider_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISlider()
    }
}
