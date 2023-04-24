//
//  TopRoundedCornerShape.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/23/23.
//

import SwiftUI

struct TopRoundedCornerShape: Shape {
    
    var radius = 35
    var corners = [UIRectCorner.topLeft, UIRectCorner.topRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct TopRoundedCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        TopRoundedCornerShape()
    }
}
