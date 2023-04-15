//
//  CoverImageView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages : [CoverModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView{
            ForEach(coverImages, id: \.self){ item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                
            }
        }.tabViewStyle(PageTabViewStyle())
        
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
