//
//  MagnificationGesture.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct MagnificationGestureTest: View {
    
    @GestureState var zoomFactor : CGFloat = 1.0
    @State var currentScale : CGFloat = 0.0
    @State var lastAmount : CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .foregroundColor(.white)
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.purple)
                )
//                .scaleEffect(1 + currentScale + lastAmount)
//            .gesture(magnificationGesture)
            
            VStack(spacing: 16){
                HStack{
                    Circle()
                        .frame(width: 36, height: 36)
                    Text("Shadat Tonmoy")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 300)
                    .scaleEffect(1 + currentScale)
                    .gesture(magnificationGesture)

                
                HStack{
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("This is a test caption ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
            
    }
    
    var magnificationGesture : some Gesture{
        return MagnificationGesture()
                .onChanged { value in
                    print("Magnification gesture value : \(value)")
                    currentScale = value - 1
           
                }
                .onEnded { value in
                    withAnimation(.spring()){
                        currentScale = 0
                    }
                    

                }
       
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureTest()
    }
}
