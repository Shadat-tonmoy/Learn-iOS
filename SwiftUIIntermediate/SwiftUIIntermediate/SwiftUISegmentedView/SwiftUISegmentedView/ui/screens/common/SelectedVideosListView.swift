//
//  SelectedVideosListView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/5/23.
//

import SwiftUI

struct SelectedVideosListView: View {
    
    //    let cellSize = 80.0
    //
    //    var videoFile : VideoFile
    //    @State private var image : UIImage?
    //    let clickCallback : (_ videoFile : VideoFile) -> Void
    
    var selectedVideoList : [VideoFile] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(selectedVideoList, content: {
                    videoFile in
                    SelectedVideoItemView(videoFile: videoFile, clickCallback: { _ in
                        
                        
                    })
                    
                })
            }
        }
        //        ForEach(selectedVideoList, content: { videoFile in
        //            SelectedVideoItemView(videoFile: videoFile, clickCallback: { videoFile in
        //
        //
        //            })
        //        })
    }
}


struct SelectedVideoItemView : View {
    
    let cellSize = 80.0
    
    var videoFile : VideoFile
    @State private var image : UIImage?
    let clickCallback : (_ videoFile : VideoFile) -> Void
    
    var body: some View {
        ZStack{
            if let videoThumb = image {
                Image(uiImage: videoThumb)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: cellSize,
                        height: cellSize
                    )
                    .clipped()
            } else {
                ProgressView()
                    .frame(
                        width: cellSize,
                        height: cellSize)
            }
            
        }
        .task {
            image = await videoFile.getVideoThumbnailAsync()
        }
        .onDisappear {
            image = nil
        }
        // We'll also make sure that the photo will
        // be square
        .aspectRatio(1, contentMode: .fit)
    }
}

struct SelectedVideosListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedVideosListView(selectedVideoList: [])
            .previewLayout(.sizeThatFits)
    }
}
