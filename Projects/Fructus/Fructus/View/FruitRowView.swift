//
//  FruitRowView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct FruitRowView: View {
    let fruit : Fruit
    
    var body: some View {
        HStack (spacing : 20){
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
                    .frame(width: 80,height:80)
                    .cornerRadius(10)
                Image(fruit.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                .frame(width:80, height: 80)
            }.padding(4)
            VStack(alignment: .leading) {
                Text(fruit.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
            
                
        }
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruits[4])
            .previewLayout(.sizeThatFits)
    }
}
