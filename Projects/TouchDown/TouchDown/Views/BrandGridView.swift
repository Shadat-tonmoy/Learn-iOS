//
//  BrandGridView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        VStack(alignment : .leading){
            Text("Brands")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayoutItems,
                          spacing : 10,
                          content: {
                    ForEach(brandList, id: \.self, content: { brand in
                        BrandItemView(brand: brand)
                        
                    })
                })
                .frame(height: 220)
                .padding(.horizontal)
            }
        }
        
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
    }
}
