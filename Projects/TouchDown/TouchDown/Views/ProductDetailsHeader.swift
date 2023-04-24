//
//  ProductDetailsHeader.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/22/23.
//

import SwiftUI

struct ProductDetailsHeader: View {
    let product : Product
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment : .leading){
                Text("Price")
                    .fontWeight(.heavy)
                    .padding(.top)
                Text(product.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .padding(.horizontal)
    }
}

struct ProductDetailsHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsHeader(product: productList[0])
            .previewLayout(.sizeThatFits)
    }
}
