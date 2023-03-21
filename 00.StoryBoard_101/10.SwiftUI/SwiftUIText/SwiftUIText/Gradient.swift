//
//  Gradient.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/19/23.
//

import SwiftUI

struct Gradient: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    gradient: SwiftUI.Gradient(colors: [Color.blue, Color.red]),
                    startPoint: .topLeading,
                    endPoint: .bottom)
            )
            .frame(width: 250, height: 150)
            
    }
}

struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        Gradient()
    }
}
