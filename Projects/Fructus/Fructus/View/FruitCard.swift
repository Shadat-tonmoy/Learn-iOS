//
//  FruitCard.swift
//  Fructus
//
//  Created by Tonmoy on 3/4/23.
//

import SwiftUI

struct FruitCard: View {
    // MARK : PROPERTIES
    
    // MARK : BODY
    var body: some View {
        ZStack {
            VStack(spacing : 20) {
                
                // : IMAGE
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8,x: 6, y: 8)
                
                // : TITLE
                Text("Blue Berry")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                // : HEADLINE
                
                Text("Description goes here")
                    .font(.caption)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                
                // : START BUTTON
                StartButton()
                
            } // : VSTACK
            
        } // : ZSTACK
        .frame(minWidth : 0, maxWidth : .infinity, minHeight : 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(LinearGradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")], startPoint: .top, endPoint: .bottom))
        .cornerRadius(8)
        
    }
}

// MARK : PREVIEW

struct FruitCard_Previews: PreviewProvider {
    static var previews: some View {
        FruitCard()
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
