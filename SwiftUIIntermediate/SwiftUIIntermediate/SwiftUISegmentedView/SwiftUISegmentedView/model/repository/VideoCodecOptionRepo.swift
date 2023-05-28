//
//  VideoCodecOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import Foundation

class VideoCodecOptionRepo {
    
    
    static let options : [VideoCodecOption] = [
        VideoCodecOption(id: Codecs.CODEC_H264, title: "h264 (libx264)", titleTrimmed: "h264", value: "libx264", isSelected: true),
        VideoCodecOption(id: Codecs.CODEC_H265, title: "h265 (libx265)", titleTrimmed: "h265", value: "libx265", isSelected: false),
    ]
    
    static func getOptions() -> [VideoCodecOption] {
        return options
    }
}
