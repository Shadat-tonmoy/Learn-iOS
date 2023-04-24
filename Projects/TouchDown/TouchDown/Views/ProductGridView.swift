//
//  ProductGridView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct ProductGridView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            HStack() {
                Text("Helmets")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.horizontal)
            
            
            LazyVGrid(columns: productGridLayoutItem,
                      spacing: 15,
                      content: {
                ForEach(productList, id: \.self, content: { product in
                    NavigationLink(destination : ProductDetailsView(product: product)){
                        ProductItemView(product: product)
                    }
                })
            })
            .padding(.horizontal)
            
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
    }
}
