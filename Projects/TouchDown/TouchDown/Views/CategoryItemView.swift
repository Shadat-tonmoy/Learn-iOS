//
//  CategoryItemView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct CategoryItemView: View {
    let category : Category
    
    var body: some View {
        HStack{
            Image(category.image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.gray)
                .font(.title3)
            
            Text(category.name.uppercased())
                .fontWeight(.light)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .background(Color.white.cornerRadius(12))
        .background(RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 1))
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categoryList[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
