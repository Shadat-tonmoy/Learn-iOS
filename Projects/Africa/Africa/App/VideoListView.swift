//
//  VideoListView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct VideoListView: View {
    let videoList : [Video] = Bundle.main.decode("videos.json")
    var body: some View {
        NavigationView{
            List(videoList, id: \.self, rowContent: { video in
                NavigationLink(destination : VideoPlayerView(video: video)){
                    VideoListItemView(video: video)
                }
                
            })
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
        }
        
        
        
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
