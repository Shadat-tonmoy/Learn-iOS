//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal : Animal
    
    var body: some View {
        HStack{
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,5)
            }
            
            
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animalList : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animal: animalList[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
