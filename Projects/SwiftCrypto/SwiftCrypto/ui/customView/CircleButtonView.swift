//
//  CircleButtonView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .frame(width: 50, height: 50)
            .foregroundColor(.theme.accent)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: .theme.accent.opacity(0.25),
                    radius: 10)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            CircleButtonView(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
            
            CircleButtonView(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
