//
//  BackgroundAndOverlaySwitfUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/21/23.
//

import SwiftUI

struct Constants{
    static let padding = 16.0
}

struct BackgroundAndOverlaySwitfUI: View {
    var body: some View {
        VStack{
            
            Text("Submit Button")
                .font(.title)
                .padding(EdgeInsets(top: Constants.padding, leading: Constants.padding, bottom: Constants.padding, trailing: Constants.padding))
                .foregroundColor(Color.white)
                .background(getGradient())
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
            
            Text("This is the second text")
            
            Spacer()
            
            Circle()
                .fill(getGradient())
                .frame(width: 150, height: 150)
                .overlay(
                    Text("1")
                        .foregroundColor(.white)
                        .font(.system(size: 48, weight: .medium))
                )
                .shadow(radius: 8)
            
            Spacer()
            
            Circle()
                .fill(getGradient())
                .frame(width: 96, height: 96)
                .overlay(
                    Text("1")
                        .background(
                            Circle()
                                .fill(Color.red)
                                .frame(width: 32, height: 32)
                        )
                        .foregroundColor(.white)
                        ,
                    alignment: .topTrailing
                )
                .overlay(
                    Image(systemName: "cart.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                )
            
            
            
                .background(
                    Circle()
                        .fill(getGradient())
                        .frame(width: 96, height: 96)
                )
                
                
                
            
            Spacer()
            
            Rectangle()
                .frame(width: 250,height: 250)
                .overlay(
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 125, height: 125),
                    alignment: .topLeading
                        
                
                )
                .background(
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 300, height: 300)
                
                )
                
            
        }
            
    }
}

func getGradient() -> SwiftUI.LinearGradient{
    return LinearGradient(gradient: SwiftUI.Gradient(colors: [Color.red,Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

struct BackgroundAndOverlaySwitfUI_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlaySwitfUI()
    }
}
