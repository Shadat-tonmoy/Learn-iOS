//
//  SwiftUIAnimation.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUIAnimation: View {
    
    @State var isAnimated : Bool = false
    
    var body: some View {
        VStack{
            
            RoundedRectangle(
                cornerRadius: isAnimated ? 50 : 16
            
            )
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300)
            
            Spacer()
                
            
            Button(action: {
                withAnimation {
                    isAnimated.toggle()
                }
                
                
            }, label: {
                Text("Toggle Style")
                    .padding(.all)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                    )
            })
        }
    }
}

struct SwiftUIAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimation()
    }
}
