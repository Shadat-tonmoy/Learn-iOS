//
//  VideoPickerItemView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import SwiftUI

struct VideoPickerItemView: View {
    
    @StateObject var videoFile : VideoFile
    @State private var image : UIImage?
    let clickCallback : (_ videoFile : VideoFile) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                if let videoThumb = image {
                    ZStack {
                        Image(uiImage: videoThumb)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                            .clipped()
                        VStack(spacing : 0) {
                            if videoFile.selected {
                                SelectionOverlay
                            } else {
                                Spacer()
                            }
                            
                            VideoInfoView
                        }
                        
                    }
                } else {
                    ProgressView()
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height)
                }
                
            }
            .task {
                image = await videoFile.getVideoThumbnailAsync()
            }
            .onDisappear {
                image = nil
            }
            
        }
        // We'll also make sure that the photo will
        // be square
        .aspectRatio(1, contentMode: .fit)
    }
    
    private var SelectionOverlay : some View {
        return ZStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.primaryColor)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.75))
    }
    
    private var VideoInfoView : some View {
        
        return HStack{
            
            VStack(alignment: .trailing){
                
                Text(videoFile.getFileResolution())
                
                Text(videoFile.getFileSize())
                
            }
        }
        .font(.system(size: 10))
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(5)
        .background(.black.opacity(0.75))
    }
    
    
}
