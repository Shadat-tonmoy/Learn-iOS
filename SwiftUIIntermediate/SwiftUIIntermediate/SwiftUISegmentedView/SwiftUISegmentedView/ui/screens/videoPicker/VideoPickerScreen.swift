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
        let size = videoLibraryService.results.fetchResult.count
        
        VStack{
            NavbarWithBackButton(title: "Pick Video")
            
            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(0..<size, id : \.self, content: { index in
                        let asset = videoLibraryService.results.fetchResult[index]
                        let thumb = videoLibraryService.getAssetThumbnail(asset: asset)
                        
                        GeometryReader { proxy in
                            ZStack {
                                Image(uiImage: thumb)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(
                                        width: proxy.size.width,
                                        height: proxy.size.width
                                    )
                                    .clipped()
                                VStack {
                                    Spacer()
                                    HStack{
                                        VStack(alignment: .trailing){
                                            
                                            Text(videoLibraryService.getAssetFileSize(asset: asset))
                                                .font(.system(size: 10))
                                            
                                            Text(videoLibraryService.getVideoDurationString(asset: asset))
                                                .font(.system(size: 10))
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(5)
                                    .background(.black.opacity(0.75))
                                }
                                
                                
                            }
                        }
                        // We'll also make sure that the photo will
                        // be square
                        .aspectRatio(1, contentMode: .fit)
                        
                        
                        
                    })
                })
                .onAppear{
                    videoLibraryService.fetchAllPhotos()
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
