//
//  BrandItemView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct BrandItemView: View {
    let brand : Brand
    
    var body: some View {
        VStack {
            Image(brand.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius:5))
        
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brandList[0])
            .previewLayout(.sizeThatFits)
    }
}
