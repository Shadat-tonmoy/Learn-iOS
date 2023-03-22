//
//  ScrollViewSwiftUI2.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct ScrollViewSwiftUI2: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0..<50){index in
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(0..<10) { hIndex in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.orange)
                                    .shadow(radius: 2)
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        Text("(\(index), \(hIndex))")
                                    
                                    )
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewSwiftUI2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewSwiftUI2()
    }
}
