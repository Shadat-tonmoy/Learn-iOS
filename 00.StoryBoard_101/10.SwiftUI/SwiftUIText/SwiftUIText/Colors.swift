//
//  Colors.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/19/23.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("primaryColor"))
            .frame(width: 350, height: 200)
            .shadow(radius: 4)
            
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
