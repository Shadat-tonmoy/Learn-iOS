//
//  FitToShareWithView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import SwiftUI

struct FitToShareWithView: View {
    var body: some View {
        VStack(alignment : .leading){
            Text("Fit To Share With")
                .font(.headline)
                .padding(.vertical)
                .padding(.horizontal, 10)
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(SocialMediaOptionRepo.getOptions()) { item in
                        SocialMediaSingleItem(
                            icon: item.icon,
                            title: item.title)
                    }
                }
                
            }
            
        }
        .padding(.bottom)
        .background(getCardBackground())
        .padding(.horizontal, 10)
    }
}

struct FitToShareWithView_Previews: PreviewProvider {
    static var previews: some View {
        FitToShareWithView()
    }
}

struct SocialMediaSingleItem: View {
    let icon : String
    let title : String
    
    var body: some View {
        VStack(spacing:10){
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(Color.primaryColor)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
    }
}
