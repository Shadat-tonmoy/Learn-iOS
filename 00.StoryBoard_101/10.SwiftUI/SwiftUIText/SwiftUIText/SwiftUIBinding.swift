//
//  SwiftUIBinding.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI


let backgroundColors : [Color] = [Color.red, Color.teal, Color.gray, Color.purple, Color.orange, Color.green, Color.blue, Color.yellow, Color.pink, Color.brown, Color.cyan]

struct SwiftUIBinding: View {
    
    @State var colorIndex = 0
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(backgroundColors[colorIndex])
                .edgesIgnoringSafeArea(.all)
            
            ColorChangeButton(colorIndex: $colorIndex)
        }
    }
}

struct SwiftUIBinding_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBinding()
    }
}

struct ColorChangeButton: View {
    @Binding var colorIndex : Int
    
    var body: some View {
        Button(action: {
            colorIndex += 1
            if(colorIndex > backgroundColors.count - 1) {
                colorIndex = 0
            }
            
            
        }, label: {
            Text("Change Color")
                .padding()
                .foregroundColor(backgroundColors[colorIndex])
                .background(
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(10)
                )
        })
    }
}
