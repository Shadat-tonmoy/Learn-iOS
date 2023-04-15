//
//  FruitDetailsView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct FruitDetailsView: View {
    let fruit : Fruit
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing : 20){
                    // HEADER
                    
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20){
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // HEADLINE
                        
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // NUTRIENTS
                        
                        // SUB HEADER
                        
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                            
                        
                        // DESCRIPTION
                        
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    } // :VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } // : VSTACK
            } // :SCROLL VIEW
            .navigationTitle(fruit.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct FruitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailsView(fruit: fruits[0])
    }
}
