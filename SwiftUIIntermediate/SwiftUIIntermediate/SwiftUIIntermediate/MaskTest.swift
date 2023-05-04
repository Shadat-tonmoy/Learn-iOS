//
//  MaskTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct MaskTest: View {
    
    @State var rating : Int = 5
    
    var body: some View {
        ZStack{
            starView
                .overlay(
                    Rectangle()
                        
                        .mask(starView)
                )
        }
    }
    
    var starView : some View{
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(index <= rating ? .yellow : .gray)
                    .onTapGesture {
                        rating = index
                    }
                
            }
        }
    }
}

struct MaskTest_Previews: PreviewProvider {
    static var previews: some View {
        MaskTest()
    }
}
