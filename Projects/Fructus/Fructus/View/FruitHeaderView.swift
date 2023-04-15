//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct FruitHeaderView: View {
    
    let fruit : Fruit
    
    var body: some View {
        ZStack{
            LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
            
        }.frame(height: 440)
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruits[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
