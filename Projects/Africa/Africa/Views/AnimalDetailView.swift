//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal : Animal
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                    // HERO IMAGE
                    
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                    
                    // TITLE
                    
                    Text(animal.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                        .underline(color : .accentColor)
                    
                    // HEADLINE
                    
                    Text(animal.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal)
                    
                    Group{
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                        
                        InsetGalleryView(animal: animal)
                    }
                    
                    // GALLERY
                    
                    
                    
                    // FACTS
                    
                    // DESCRIPTION
                    
                    // MAP
                    
                    // LINK
                } // : VSTACK
            } // : SCROLL VIEW
        }.navigationTitle("Learn More about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailView(animal: animalList[0])
    }
}
