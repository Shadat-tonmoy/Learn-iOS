//
//  SwiftUITab2.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/30/23.
//

import SwiftUI

struct SwiftUITab2: View {
    var body: some View {
        TabView(content: {
            RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
        })
        .frame(height: 350)
        .tabViewStyle(PageTabViewStyle())
        
    }
}

struct SwiftUITab2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITab2()
    }
}
