//
//  RotationGestureTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct RotationGestureTest: View {
    @State var rotationAngle : Angle = Angle(degrees: 0)
    @State var lastAnlge : Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .foregroundColor(.white)
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.purple)
            )
            .rotationEffect(rotationAngle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        rotationAngle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()){
                            rotationAngle = Angle(degrees: 0)
//                            lastAnlge = value
                        }
                    }
                
            )
        
    }
}

struct RotationGestureTest_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureTest()
    }
}
