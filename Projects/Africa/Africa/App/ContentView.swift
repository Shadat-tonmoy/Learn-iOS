//
//  ContentView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    
    let animal : [Animal] = Bundle.main.decode("animals.json")
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
