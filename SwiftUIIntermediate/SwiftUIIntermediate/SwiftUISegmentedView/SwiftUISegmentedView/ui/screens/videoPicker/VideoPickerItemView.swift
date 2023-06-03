//
//  VideoPickerItemView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import SwiftUI

struct VideoPickerItemView: View {
    
    let videoFile : VideoFile
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(uiImage: videoFile.getVideoThumbnail())
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
                            
                            Text(videoFile.getFileResolution())
                                .font(.system(size: 10))
                            
                            Text(videoFile.getFileSize())
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
    }
}
