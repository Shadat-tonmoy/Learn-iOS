//
//  VideoListItemView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI

struct VideoListItemView: View {
    let video : Video
    var body: some View {
        HStack{
            Image(video.id)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 100)
                .cornerRadius(12)
                .overlay(content: {
                    Image(systemName: "play.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                })
            
            VStack (alignment: .leading){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.bold)
                .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .lineLimit(2)
            }
        }
        .padding(.top, 10)
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static let videoList : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videoList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
