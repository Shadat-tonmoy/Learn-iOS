//
//  MagnificationGesture.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct MagnificationGestureTest: View {
    
    @State var zoomFactor : CGFloat = 1.0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .foregroundColor(.white)
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.purple)
            )
            
    }
    
    var magnificationGesture : some Gesture{
        return MagnificationGestureTest()
                .updating($zoomFactor) { value, scale, transaction in
                    // updating scale with returned value from magnification gesture
                    scale = value
                }
                .onChanged { value in
           
                }
                .onEnded { value in

                }
       
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureTest()
    }
}
