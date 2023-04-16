//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal : Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                    
                }
                
            }
        }
        
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animalList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
