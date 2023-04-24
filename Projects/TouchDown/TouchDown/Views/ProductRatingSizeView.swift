//
//  ProductRatingSizeView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct ProductRatingSizeView: View {
    let sizes : [String] = ["XS", "S", "M", "L", "XL"]
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Ratings")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                HStack{
                    ForEach(0 ..< 5){ item in
                        Image(systemName: "star.fill")
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(colorGray.cornerRadius(5))
                        .foregroundColor(.white)
                        
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment:.trailing){
                Text("Sizes")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                HStack{
                    ForEach(sizes, id: \.self, content: { size in
                        Text(size)
                            .frame(width: 28, height: 28)
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorGray, lineWidth: 2)
                                    
                            )
                    })
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProductRatingSizeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRatingSizeView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
