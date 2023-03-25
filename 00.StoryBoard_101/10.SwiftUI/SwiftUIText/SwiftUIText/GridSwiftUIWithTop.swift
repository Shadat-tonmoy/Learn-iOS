//
//  GridSwiftUIWithTop.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct GridSwiftUIWithTop: View {
    var body: some View {
        let gridItems : [GridItem] = [
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil),
            GridItem(.flexible(), spacing: nil, alignment: nil)
        ]
        ScrollView{
            Rectangle()
                .frame(width: .infinity, height: 300)
                .cornerRadius(10)
                .padding(.horizontal)
            
            LazyVGrid(columns: gridItems){
                ForEach(0..<50){ index in
                    Rectangle()
                        .frame(height: 150)
                        .cornerRadius(10)
                    
                }
            }
            .padding(.horizontal)
                
        }
    }
}

struct GridSwiftUIWithTop_Previews: PreviewProvider {
    static var previews: some View {
        GridSwiftUIWithTop()
    }
}
