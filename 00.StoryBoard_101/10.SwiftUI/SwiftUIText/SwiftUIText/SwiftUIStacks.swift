//
//  SwiftUIStacks.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/21/23.
//

import SwiftUI

struct Const{
    static let rectDimen = 120.0
}

struct SwiftUIStacks: View {
    
    var body: some View {
        VStack(
            alignment: .trailing, spacing: 16.0, content: {
            
            Rectangle()
                .fill(.red)
                .frame(width: Const.rectDimen, height : Const.rectDimen)
            
            Rectangle()
                .fill(.green)
                .frame(width: Const.rectDimen, height: Const.rectDimen)
            
            Rectangle()
                .fill(.purple)
                .frame(width: Const.rectDimen, height: Const.rectDimen)
                
            getRectangle(color: Color.blue)
            
            HStack{
                getRectangle(color: Color.red)
                getRectangle(color: Color.green)
                getRectangle(color: Color.blue)
            }
                
            HStack(alignment: .bottom, spacing: 0.0,  content: {
                
                getRectangle(color: .purple, width: 40, height: 60)
                getRectangle(color: .green, width: 40, height: 90)
                getRectangle(color: .red, width: 40, height: 156)
                
            })
        })
    }
}

func getRectangle(color : Color) -> some View{
    return Rectangle()
        .fill(color)
        .frame(width: Const.rectDimen, height: Const.rectDimen)
        
}

func getRectangle(color : Color, width : CGFloat, height : CGFloat) -> some View{
    return Rectangle()
        .fill(color)
        .frame(width: width, height: height)
        
}

struct SwiftUIStacks_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStacks()
    }
}
