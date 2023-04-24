//
//  ProductCountView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct ProductCountView: View {
    
    @State var productCount = 0
    
    var body: some View {
        HStack{
            Button(action: {
                productCount += 1
                
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Text("\(productCount)")
                .font(.title3)
            
            Button(action: {
                productCount -= 1
                if productCount < 0 {
                    productCount = 0
                }
                
            }, label: {
                Image(systemName: "minus.circle")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            Button(action: {
                productCount -= 1
                if productCount < 0 {
                    productCount = 0
                }
                
            }, label: {
                Image(systemName: "heart.circle")
                    .font(.title)
                    .foregroundColor(.red)
            })
            
            
        }.padding(.horizontal)
    }
}

struct ProductCountView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCountView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
