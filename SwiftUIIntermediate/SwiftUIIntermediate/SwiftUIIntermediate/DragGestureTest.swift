//
//  DragGestureTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct DragGestureTest: View {
    
    @State var offset : CGSize = .zero
    @State var xOffset = 0.0
    @State var yOffset = 0.0
    @GestureState private var dragValue = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true){
            
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.green)
                    .frame(width: 350, height: 70)
                    .offset(x : xOffset, y: yOffset)
                    .gesture(dragGesture)
                .padding(.vertical,50)
            }
            .frame(width: 890)
        }
        .frame(maxWidth: 1500)
        .background(.gray)
        
        
    }
    
    var dragGesture : some Gesture{
        DragGesture(minimumDistance: 2)
            .updating($dragValue, body: { value, state, transaction in
//                print("Updating Value : \(value), state : \(state)")
                
            })
            .onChanged{ value in
                print("x value : \(value.translation.width)")
//                xOffset += value.translation.width
                xOffset = value.translation.width
                print("XOffset : \(xOffset)")
            }
            .onEnded{ value in
                xOffset = value.translation.width
            }
    }
}

struct DragGestureTest_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureTest()
    }
}
