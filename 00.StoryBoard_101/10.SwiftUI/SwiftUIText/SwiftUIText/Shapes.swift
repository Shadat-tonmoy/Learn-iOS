//
//  Shapes.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/19/23.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .frame(width : 300, height: 64)
            
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
