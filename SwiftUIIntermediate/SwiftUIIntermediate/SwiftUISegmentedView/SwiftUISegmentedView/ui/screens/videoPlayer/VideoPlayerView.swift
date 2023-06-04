//
//  VideoPlayerView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/4/23.
//

import SwiftUI
import AVKit
import Photos

struct VideoPlayerView: View {
    
    let videoFile : VideoFile
    @State var videoPlayer : AVPlayer? = nil
    
    var body: some View {
        VStack {
            if let videoPlayer = self.videoPlayer {
                VideoPlayer(player: videoPlayer)
                    .overlay(alignment: .topLeading, content: {
                        HStack {
                            Text(videoFile.title)
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.accentColor)
                        }
                    })
            } else {
                ProgressView()
            }
        }.onAppear{
            prepareVideoPlayer(video: videoFile)
        }
        
    }
    
    func prepareVideoPlayer(video : VideoFile) {
        let videoId = video.id
        let asset = PHAsset.fetchAssets(withLocalIdentifiers: [videoId], options: nil).firstObject
        
        if let videoFileAsset = asset {
            
            PHCachingImageManager().requestAVAsset(forVideo: videoFileAsset, options: nil) { (asset, audioMix, args) in
                let asset = asset as! AVURLAsset
                
                DispatchQueue.main.async {
                    videoPlayer = AVPlayer(url: asset.url)
                    let playerViewController = AVPlayerViewController()
                    playerViewController.player = videoPlayer
                    videoPlayer?.playImmediately(atRate: 1.0)
                }
            }
        }
        
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoFile: DummyFiles.videoFile)
    }
}
