//
//  ProductItemView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct ProductItemView: View {
    let product : Product
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .background(Color(red: product.red(), green: product.green(), blue: product.blue()))
                .cornerRadius(12)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
        }
        
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: productList[0])
    }
}
