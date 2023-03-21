//
//  SwiftUI_Images.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/20/23.
//

import SwiftUI

struct SwiftUI_Images: View {
    var body: some View {
        Image("bg_image")
            .resizable()
            .frame(width: 390, height: 250)
            .aspectRatio(contentMode: .fill)
//            .cornerRadius(<#T##radius: CGFloat##CGFloat#>)
            .clipShape(Circle())
    }
}

struct SwiftUI_Images_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Images()
    }
}
