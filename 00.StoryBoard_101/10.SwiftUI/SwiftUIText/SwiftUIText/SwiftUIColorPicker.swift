//
//  SwiftUIColorPicker.swift
//  SwiftUIText
//
//  Created by Tonmoy on 29/3/23.
//

import SwiftUI

struct SwiftUIColorPicker: View {
    @State var backgroundColor : Color = Color.orange
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Pick A Color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            .padding()
            
        }
    }
}

struct SwiftUIColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColorPicker()
    }
}
