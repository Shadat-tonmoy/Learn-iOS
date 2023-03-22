//
//  ScrollViewSwiftUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct ScrollViewSwiftUI: View {
    var body: some View {
        let dataSet = ["A","B","C", "D","E","F","G","H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W"]
        ScrollView{
            VStack{
                ForEach(dataSet.indices) { index in
                    Text(dataSet[index])
                        .frame(width : 60, height: 60)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.teal)
                                
                                
                        )
                    
                }
            }
        }
    }
}

struct ScrollViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewSwiftUI()
    }
}
