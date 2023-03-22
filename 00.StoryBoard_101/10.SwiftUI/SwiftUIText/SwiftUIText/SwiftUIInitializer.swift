//
//  SwiftUIInitializer.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct SwiftUIInitializer: View {
    
    let backgroundColor : Color
    let count : Int
    let title : String
    
    init(backgroundColor: Color, count: Int, title: String) {
        self.backgroundColor = backgroundColor
        self.count = count
        self.title = title
    }
    
    
    var body: some View {
        VStack(spacing : 10){
            Text("\(count)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .underline()
            
            Text("\(title)")
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(16)
        .shadow(radius: 4)
            
    }
}

struct SwiftUIInitializer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIInitializer(backgroundColor: Color.teal, count: 10, title: "Orange")
    }
}
