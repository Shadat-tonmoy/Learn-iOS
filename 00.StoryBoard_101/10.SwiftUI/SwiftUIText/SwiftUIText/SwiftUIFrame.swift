//
//  SwiftUIFrame.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/21/23.
//

import SwiftUI

struct SwiftUIFrame: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            .background(Color.green)
        
    }
}

struct SwiftUIFrame_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFrame()
    }
}
