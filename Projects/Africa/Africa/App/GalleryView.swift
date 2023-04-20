//
//  GalleryView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct GalleryView: View {
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
//    let gridItems : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    let gridItems : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State var selectedImage = "lion"
    @State var selectedAnimal = "Lion"
    @State var gridItemCount = 3.0
    @State var gridItems : [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    func switchGrid(){
        gridItems = Array(repeating: .init(.flexible()), count: Int(gridItemCount))
    }

    
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
                    
                    Slider(value: $gridItemCount, in: 2...6, step : 1)
                        .onChange(of: gridItemCount, perform: { value in
                            switchGrid()
                        })
                        .padding(.horizontal)
                    
                    
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
                    .animation(.easeIn)
                }
                
            }
            .onAppear{
                switchGrid()
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
