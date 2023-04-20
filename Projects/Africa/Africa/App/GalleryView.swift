//
//  GalleryView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct GalleryView: View {
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    let gridItems : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var selectedImage = "lion"
    @State var selectedAnimal = "Lion"

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing : 50){
                    
                    Image(selectedImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(content: {
                            Circle().stroke(lineWidth: 5)
                        })
                    
                    
                    LazyVGrid(columns: gridItems, spacing : 30, content: {
                        ForEach(animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(content: {
                                    ZStack {
                                        Circle()
                                            .stroke(lineWidth: 2)
                                        if(animal.name == selectedAnimal){
                                            selectionOverlay
                                        }
                                        
                                    }
                                    
                                })
                                .onTapGesture {
                                    selectedImage = animal.image
                                    selectedAnimal = animal.name
                                }
                        }
                    })
                }
                
            }
            .navigationTitle(selectedAnimal)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    var selectionOverlay : some View {
        Circle()
            .fill(.black.opacity(0.5))
            .overlay(content : {
                Image(systemName: "checkmark.circle.fill")
                
            })
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
