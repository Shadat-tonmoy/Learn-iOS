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
    let backgroundColors : [Color] = [Color.red, Color.teal, Color.gray, Color.purple, Color.orange, Color.green, Color.blue, Color.yellow, Color.pink, Color.brown, Color.cyan]
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(backgroundColors[colorIndex])
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                countText
                
                incrementButton
                
                decrementButton
                
                changeColorButton
            }
            
        }
    }
    
    func updateBackgroundColor(){
        colorIndex += 1
        if(colorIndex > backgroundColors.count-1){
            colorIndex = 0
        }
    }
    
    var incrementButton : some View{
        
        func incrementCount(){
            self.countValue += 1
        }
        
        return Button(action: {
           incrementCount()
            
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
    }
    
    var decrementButton : some View{
        func decrementCount(){
            self.countValue -= 1
            if(countValue <= 0) {
                countValue = 0
            }
        }
        
        return Button(action: {
            decrementCount()
            
        }, label: {
            Text("Tap to decrease")
                .padding()
                .foregroundColor(.white)
                .background(
                    Capsule()
                        .stroke(.white,lineWidth: 2)
                )
            
        })
    }
    
    var changeColorButton : some View{
        Button(action: {
            updateBackgroundColor()
            
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
    
    var countText : some View{
        Text("Count is \(countValue)")
            .foregroundColor(.white)
            .padding()
            .font(.title)
    }
}

struct SwiftUIState_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIState()
    }
}
