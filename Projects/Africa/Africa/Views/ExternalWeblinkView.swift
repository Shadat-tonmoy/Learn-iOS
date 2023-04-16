//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }
        }
        
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animalList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
