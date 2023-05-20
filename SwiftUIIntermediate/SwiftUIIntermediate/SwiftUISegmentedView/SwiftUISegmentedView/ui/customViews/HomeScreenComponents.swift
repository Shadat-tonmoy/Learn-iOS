//
//  HomeScreenIcon.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/15/23.
//

import SwiftUI
import PhotosUI

struct HomeScreenIcon: View {
    
    let iconName : String
    let title : String
    
    var body: some View {
        VStack(spacing : 15){
            Image(iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.toolbarBG)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.defaultBG)
                .shadow(radius: 1)
        )
    }
}

struct HomeScreenVideoPickerItem : View {
    
    
    let iconName : String
    let title : String
    @Binding var selectedVideos : [PhotosPickerItem]
    let selectionCallback : (_ selectedVideos : [PhotosPickerItem]) -> Void
    
    
    var body: some View {
        
        PhotosPicker(
            selection: $selectedVideos,
            matching: .any(of: [.videos, .not(.images)])) {
                HomeScreenIcon(iconName: iconName, title: title)
                
            }
            .onChange(of: selectedVideos){ selectedItems in
//                print("Selected videos : \(selectedItems)")
                selectionCallback(selectedItems)
            }
        
    }
}

struct HomeScreenIcon_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenIcon(iconName: "fastCompression", title: "Fast\nCompression")
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
