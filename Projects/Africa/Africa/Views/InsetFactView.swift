//
//  InsetFactView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct InsetFactView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self, content: { fact in
                    Text(fact)
                })
                
            }.tabViewStyle(PageTabViewStyle())
                .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animalList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
