//
//  DragGestureTest3.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct DragGestureTest3: View {
    
    @State private var yOffset : CGFloat = UIScreen.main.bounds.height * 0.83
    @State private var currentYOffset : CGFloat = 0.0
    private var maxYOffset : CGFloat = UIScreen.main.bounds.height * 0.5
    private var initialYOffset : CGFloat = UIScreen.main.bounds.height * 0.83
    
    var body: some View {
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            SignupView()
                .offset(x : 0, y : yOffset + currentYOffset)
                .gesture(dragGesture)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var dragGesture : some Gesture{
        return DragGesture()
            .onChanged{ value in
                withAnimation(.spring()){
                    currentYOffset = value.translation.height
                }
            }
            .onEnded{ value in
                withAnimation(.spring()){
                    print("CUrrent y offset : \(currentYOffset)")
                    if (currentYOffset < -150) {
                        yOffset = 0
                        currentYOffset = 0
                    } else {
                        yOffset = initialYOffset
                        currentYOffset = 0
                    }
                }
                
            }
    }
}

struct DragGestureTest3_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureTest3()
    }
}

struct SignupView: View {
    var body: some View {
        VStack(spacing: 20, content: {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description of our app. This is my favorite SwiftUI course and I recomment to all of my friends to subscribe to Swiftful Thininkg!")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Text("Crate An Account")
                .font(.headline)
                .padding()
                .padding(.horizontal,80)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                    
                )
            
            Spacer()
        })
        .frame(width: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
