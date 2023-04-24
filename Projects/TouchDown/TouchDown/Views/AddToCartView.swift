//
//  AddToCartView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct AddToCartView: View {
    
    let product : Product
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Spacer()
            Text("Add To Cart".uppercased())
                .fontWeight(.heavy)
                .font(.title2)
                .foregroundColor(.white)
            Spacer()
        })
        .padding(15)
        .background(content: {
            RoundedRectangle(cornerRadius: 12)
                .fill(product.getColor)
        })
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView(product: productList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
