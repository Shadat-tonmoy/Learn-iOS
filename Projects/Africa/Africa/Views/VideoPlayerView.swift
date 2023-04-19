//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/19/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let video : Video
    
    var body: some View {
        VideoPlayer(player: getVideoPlayer(video: video))
            .overlay(alignment: .topLeading, content: {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    .padding()
                    
                    Text(video.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                }
                
            })
    }
    
    func getVideoPlayer(video :Video) -> AVPlayer {
        let player = AVPlayer(url: Bundle.main.url(forResource: video.id, withExtension: ".mp4")!)
        player.playImmediately(atRate: 1.0)
        return player
        
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videoList : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoPlayerView(video: videoList[1])
    }
}
