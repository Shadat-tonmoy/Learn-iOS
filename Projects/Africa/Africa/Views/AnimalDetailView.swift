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
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                
                // DESCRIPTION
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }.padding(.horizontal)
                
                // MAP
                
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                    
                }.padding(.horizontal)
                
                // LINK
                
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWeblinkView(animal: animal)
                }.padding(.horizontal)
            } // : VSTACK
        } // : SCROLL VIEW
        .navigationBarTitle("Learn More about \(animal.name)", displayMode: .inline)
        
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailView(animal: animalList[0])
    }
}
