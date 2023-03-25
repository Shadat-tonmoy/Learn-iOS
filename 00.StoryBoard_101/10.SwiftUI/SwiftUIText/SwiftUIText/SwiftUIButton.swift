//
//  SwiftUIButton.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUIButton: View {
    @State var text = "Once you click the button it will be changed"
    var body: some View {
        VStack(spacing : 50) {
            Text(text)
            Button("Click Here"){
                self.text = "Button was clicked"
            }
            
            Button(action: {
                self.text = "Nice Button Was Clicked"
                
            }, label: {
                Text("Nice Button")
                    .padding()
                    .padding(.horizontal,50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.teal)
                            .shadow(radius: 4)
                    ).foregroundColor(.white)
            })
            
            Button(action: {
                self.text = "Heart button was clicked"
                
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 64)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            
                    
                    )
            })
            
            Button(action: {
                self.text = "Capsule Button was clicked"
                
            }, label: {
                Text("Capsule Button")
                    .foregroundColor(.gray)
                    .bold()
                    .padding()
                    .padding(.horizontal,50)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    
                    )
                
            })
        }
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}
