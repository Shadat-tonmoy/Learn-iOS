//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct FruitNutrientsView: View {
    let fruit : Fruit
    let nutrients : [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var body: some View {
        GroupBox(){
            DisclosureGroup("Nutritional value per 100g"){
                ForEach(0..<nutrients.count, id: \.self){ index in
                    
                    if(index > 0) {
                        Divider().padding(.vertical, 2)
                    } else {
                        HStack{}.padding(.top,30)
                    }
                    HStack{
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[index])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 30)
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
            }
            
        } // : GROUP BOX
        
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruits[4])
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
