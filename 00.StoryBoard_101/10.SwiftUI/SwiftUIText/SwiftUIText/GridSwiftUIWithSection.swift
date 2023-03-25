//
//  GridSwiftUIWithSection.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct GridSwiftUIWithSection: View {
    
    let gridItems : [GridItem] = [
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView{
            Rectangle()
                .fill(.purple)
                .frame(height: 340)
                
    
            LazyVGrid(
                columns: gridItems,
                spacing: 10,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(
                        header: Text("Section 1")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white),
                        content: {
                            ForEach(0..<10){ index in
                                Rectangle()
                                    .frame(height: 150)
                                    .cornerRadius(8)
                                
                            }
                    })
                    
                    Section(
                        header:
                            Text(
                                "Section 2"
                            ).frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.green)
                            .foregroundColor(.white)
                        
                        ,
                        content: {
                            ForEach(0..<15){ index in
                                Rectangle()
                                    .frame(height: 150)
                                    .cornerRadius(8)
                                
                            }
                        }
                                
                    )
                    
            })
        }
        
    }
}

struct GridSwiftUIWithSection_Previews: PreviewProvider {
    static var previews: some View {
        GridSwiftUIWithSection()
    }
}
