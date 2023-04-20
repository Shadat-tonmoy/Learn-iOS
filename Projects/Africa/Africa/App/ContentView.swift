//
//  ContentView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    
    let animal : [Animal] = Bundle.main.decode("animals.json")
    @State var isGridActivated = false
    
    var body: some View {
        NavigationView {
            List() {
                CoverImageView()
                    .frame(width: 400, height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                ForEach(animal, id: \.self) { animal in
                    NavigationLink(destination : AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }
                }
                
            }.navigationTitle("Africa")
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
                        isGridActivated = true
                        
                    }, label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title2)
                            .foregroundColor(isGridActivated ? .accentColor : .white)
                    })
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
