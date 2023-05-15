//
//  HomeScreenIcon.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/15/23.
//

import SwiftUI

struct HomeScreenIcon: View {
    
    let iconName : String
    let title : String
    
    var body: some View {
        VStack(spacing : 10){
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(AppColors.toolbarBG)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(AppColors.defaultBG)
                .shadow(radius: 1)
        )
    }
}

struct HomeScreenIcon_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenIcon(iconName: "slider.horizontal.3", title: "Fast\nCompression")
            .previewLayout(.sizeThatFits)
    }
    
}


struct HomeScreenSectionHeader: View {
    
    let title : String
    
    var body: some View {
        VStack{
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
            
            
            Divider()
                .padding(.horizontal)
        }
        .padding(.top)
        
    }
}
