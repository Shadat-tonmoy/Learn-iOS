//
//  ContentView.swift
//  Fructus
//
//  Created by Tonmoy on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView(content: {
            List(fruits.shuffled(), rowContent: { fruit in
                NavigationLink(destination: FruitDetailsView(fruit: fruit)){
                    FruitRowView(fruit: fruit)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Fruits")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
