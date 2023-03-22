//
//  SpacerSwiftUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct SpacerSwiftUI: View {
    var body: some View {
        HStack(spacing: 0){
            
            Spacer()
                .frame(height: 10)
                .background(.yellow)
            
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.yellow)
        
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.yellow)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 10)
                .background(.yellow)
            
            Rectangle()
                .fill(.black)
                .frame(width: 50, height: 50)
                
            
            
        }
    }
}

struct SpacerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SpacerSwiftUI()
    }
}
