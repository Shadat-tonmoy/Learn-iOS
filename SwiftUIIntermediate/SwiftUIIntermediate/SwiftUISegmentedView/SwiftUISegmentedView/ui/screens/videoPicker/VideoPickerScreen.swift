//
//  VideoPickerScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/19/23.
//

import SwiftUI

struct VideoPickerScreen: View {
    
    @StateObject private var videoLibraryService = VideoLibraryService()
    
    let gridItems : [GridItem] = [
        GridItem(.flexible(),alignment: .leading),
        GridItem(.flexible(),alignment: .leading),
        GridItem(.flexible(),alignment: .leading)
    ]
    
    var body: some View {
        
        VStack{
            NavbarWithBackButton(title: "Pick Video")
            
            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(videoLibraryService.videoFiles, content: { videoFile in
                        
                        VideoPickerItemView(videoFile: videoFile)
                        
                    })
                })
                .onAppear{
                    videoLibraryService.fetchAllVideos()
                }
            }.navigationBarBackButtonHidden()
        }
        
        
        
        
    }
}

struct VideoPickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        VideoPickerScreen()
    }
}
