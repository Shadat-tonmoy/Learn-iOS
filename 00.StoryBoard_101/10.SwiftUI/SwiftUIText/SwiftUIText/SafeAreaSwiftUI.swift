//
//  SafeAreaSwiftUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SafeAreaSwiftUI: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
            
        }
        .background(.teal)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SafeAreaSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaSwiftUI()
    }
}
