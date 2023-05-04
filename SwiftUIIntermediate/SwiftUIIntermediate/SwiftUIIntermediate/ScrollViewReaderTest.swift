//
//  ScrollViewReaderTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct ScrollViewReaderTest: View {
    
    @State var pageNumberText : String = ""
    
    var body: some View {
        ScrollViewReader{ proxy in
            
            VStack{
                
                TextField("Enter index to scroll", text: $pageNumberText)
                    .keyboardType(.numberPad)
                    .padding()
                    .padding(.horizontal,10)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray.opacity(0.25))
                    )
                    .padding()
                
                Button("Click Here To Go To index \(pageNumberText)"){
                    withAnimation(.spring()){
                        if let indexToScroll = try? Int(pageNumberText) {
                            proxy.scrollTo(indexToScroll, anchor: .top)
                        } else {
                            return
                        }
                        
                    }
                }
                .buttonStyle(.borderedProminent)
    
                
            }
            
            
            
            ScrollView{
                ForEach(0..<50) { index in
                    Text("This is item no \(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding()
                        .id(index)
                }
                
                
                
                
            }
            
            
        }
        
    }
}

struct ScrollViewReaderTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderTest()
    }
}
