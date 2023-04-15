//
//  StartButton.swift
//  Fructus
//
//  Created by Tonmoy on 3/4/23.
//

import SwiftUI

struct StartButton: View {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    
    var body: some View {
        Button(action: {
            isOnboarding = false
            
        }, label: {
            HStack {
                Text("Start")
                    .foregroundColor(.white)
                
                Image(systemName: "arrow.right.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
            
        }) // : BUTTON
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
            .previewLayout(.sizeThatFits)
    }
}
