//
//  ContentView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    
    let animal : [Animal] = Bundle.main.decode("animals.json")
    @State var animalGridItems : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State var isGridActivated = false
    @State var gridCellCount = 2
    
    var body: some View {
        NavigationView {
            
            Group{
                if !isGridActivated {
                    List() {
                        CoverImageView()
                            .frame(width: 400, height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                        
                        ForEach(animal, id: \.self) { animal in
                            NavigationLink(destination : AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }
                        }
                        
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: animalGridItems, content: {
                            ForEach(animal) { animal in
                                NavigationLink(destination : AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                                
                            }
                        }).onAppear{
                            withAnimation(.easeIn(duration: 2)){
                                
                            }
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Africa")
                .listStyle(.inset)
                .navigationBarItems(trailing: HStack{
                    Button(action: {
                        isGridActivated = false
                        
                    }, label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridActivated ? .white : .accentColor)
                    })
                    
                    Button(action: {
                        if(!isGridActivated){
                            isGridActivated = true
                        } else {
                            switchGridType()
                        }
                        
                    }, label: {
                        Image(systemName: getGridIcon())
                            .font(.title2)
                            .foregroundColor(isGridActivated ? .accentColor : .white)
                    })
                })
        }
    }
    
    func switchGridType(){
        gridCellCount += 1
        gridCellCount %= 4
        if(gridCellCount == 0) {
            gridCellCount = 1
        }
        animalGridItems = Array(repeating: .init(.flexible()), count: gridCellCount)
    }
    
    func getGridIcon() -> String{
        if(gridCellCount == 1){
            return "rectangle.grid.1x2"
        } else if(gridCellCount == 3){
            return "square.grid.3x2"
        } else {
            return "square.grid.2x2"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
