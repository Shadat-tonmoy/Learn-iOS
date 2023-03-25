//
//  SwiftUIExtractingSubViews.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUIExtractingSubViews: View, OnTapDelegate{
    
    @State var header : String = "Tap Any Fruits To See Here"
    
    func onTapped(title: String) {
        header = title
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(){
                LazyVStack{
                    
                    TopheaderView(header: header)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(
                            content: {
                                FruitCard(title: "Apple", quantity: 10, delegate: self)
                                FruitCard(title: "Orange", quantity: 4, delegate: self)
                                FruitCard(title: "Pineapple", quantity: 12, delegate: self)
                                FruitCard(title: "Grape", quantity: 12, delegate: self)
                                FruitCard(title: "Watermelon", quantity: 12, delegate: self)
                            }).padding(.horizontal)
                    }
                    
                }
                
            }
        }
    }
    
    
}

struct SwiftUIExtractingSubViews_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIExtractingSubViews()
    }
}

protocol OnTapDelegate {
    func onTapped(title : String)
}


struct FruitCard: View {
    
    let title : String
    let quantity : Int
    let delegate : OnTapDelegate
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.orange)
            .frame(width: 100, height: 100)
            .overlay(
                VStack(spacing: 2, content: {
                    Text("\(quantity)")
                        .foregroundColor(Color("textColor"))
                    Text(title)
                        .foregroundColor(Color("textColor"))
                })
            )
            .onTapGesture {
                delegate.onTapped(title: title)
            }
    }
}

struct TopheaderView: View {
    let header : String
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .frame(height: 200)
            .overlay(
                Text(header)
                    .multilineTextAlignment(.center)                    .font(.largeTitle)
                    .bold(true)
                    .foregroundColor(.orange)
                
            )
    }
}
