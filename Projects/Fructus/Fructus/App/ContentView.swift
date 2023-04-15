//
//  ContentView.swift
//  Fructus
//
//  Created by Tonmoy on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationView(content: {
            List(fruits.shuffled(), rowContent: { fruit in
                NavigationLink(destination: FruitDetailsView(fruit: fruit)){
                    FruitRowView(fruit: fruit)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }))
            .sheet(isPresented: $isShowingSettings, onDismiss: {
                isShowingSettings = false
            }, content: {
                SettingsView()
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
