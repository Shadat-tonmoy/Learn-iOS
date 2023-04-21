//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: gridLayoutItems, alignment: .center, spacing : columnSpacing,
                      pinnedViews: [], content: {
                ForEach(categoryList, id: \.self, content: { category in
                    CategoryItemView(category: category)
                })
            })
            .frame(height: 140)
            .padding()
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
    }
}
