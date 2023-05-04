//
//  DragGestureTest2.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct DragGestureTest2: View {
    
    @State private var offset : CGSize = .zero
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 300, height: 500)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationDegree()))
                .offset(offset)
                .gesture(dragGesture)
            
        }
        
    }
    
    var dragGesture : some Gesture{
        return DragGesture()
            .onChanged{ value in
                offset = value.translation
                
            }
            .onEnded{ value in
                withAnimation(.spring()){
                    offset = .zero
                }
            }
    }
    
    func getScaleAmount() -> CGFloat{
        let screenWidth = UIScreen.main.bounds.width
        let maxOffset = screenWidth / 2
        let currentOffset = abs(offset.width)
        let percentage = currentOffset / maxOffset
        return 1.0 - min(percentage, 0.25)
    }
    
    func getRotationDegree() -> Double{
        let screenWidth = UIScreen.main.bounds.width
        let maxOffset = screenWidth / 2
        let currentOffset = offset.width
        let percentage = currentOffset / maxOffset
        let maxDegree = 10.0
        return maxDegree * percentage
    }
}

struct DragGestureTest2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureTest2()
    }
}
