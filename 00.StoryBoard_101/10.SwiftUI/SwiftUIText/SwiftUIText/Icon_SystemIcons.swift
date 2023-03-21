//
//  Icon_SystemIcons.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/19/23.
//

import SwiftUI

struct Icon_SystemIcons: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
//            .font(.system(size: 50))
            .foregroundColor(.red)
            .frame(width: 96, height: 96)
            
    }
}

struct Icon_SystemIcons_Previews: PreviewProvider {
    static var previews: some View {
        Icon_SystemIcons()
    }
}
