//
//  SwiftUIState.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUIState: View {
    @State var countValue = 1
    @State var colorIndex = 0
    let backgroundColors : [Color] = [Color.red, Color.teal, Color.gray, Color.purple, Color.orange, Color.green, Color.blue]
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(backgroundColors[colorIndex])
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                Text("Count is \(countValue)")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title)
                
                Button(action: {
                    self.countValue += 1
                    
                }, label: {
                    Text("Tap to increase")
                        .padding()
                        .foregroundColor(backgroundColors[colorIndex])
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .shadow(radius: 5)
                         )
                })
                
                Button(action: {
                    self.countValue -= 1
                    if(countValue <= 0) {
                        countValue = 0
                        
                    }
                    
                }, label: {
                    Text("Tap to decrease")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .stroke(.white,lineWidth: 2)
                        )
                    
                })
                
                Button(action: {
                    colorIndex += 1
                    if(colorIndex > backgroundColors.count-1){
                        colorIndex = 0
                    }
                    
                }, label: {
                    Text("Change Color")
                        .padding()
                        .foregroundColor(backgroundColors[colorIndex])
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                        )
                })
            }
            
        }
    }
}

struct SwiftUIState_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIState()
    }
}
