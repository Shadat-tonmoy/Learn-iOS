//
//  LongPressGesture.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State var isCompleted = false
    @State var isSuccess = false
    
    var body: some View {
        VStack {
            Text(isCompleted ? "Completed" : "Not Completed")
                .padding()
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isCompleted ? .green : .purple)
                )
                .foregroundColor(.white)
                .onLongPressGesture(
                    minimumDuration: 2,
                    perform: {
                        //                        isCompleted.toggle()
                    })
            
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack{
                Text("Click Here")
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue)
                    )
                    .onLongPressGesture(minimumDuration : 1,
                                        perform: {
                        withAnimation(.easeInOut) {
                            // at min duration
                            isSuccess = true
                        }
                        
                        
                    },
                                        onPressingChanged: { (isPressing) in
                        if(isPressing){
                            withAnimation(.easeInOut(duration: 1.0)){
                                isCompleted = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                if(!isSuccess) {
                                    withAnimation(.easeInOut) {
                                        isCompleted = false
                                    }
                                }
                            })
                        }
                        
                    })
                Text("Reset")
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.purple)
                    )
                    .onTapGesture {
                        isCompleted = false
                        isSuccess = false
                    }
            }
        }
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
