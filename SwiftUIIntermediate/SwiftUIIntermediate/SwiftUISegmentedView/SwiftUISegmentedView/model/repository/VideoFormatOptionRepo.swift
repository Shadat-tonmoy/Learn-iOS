//
//  VideoFormatOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import Foundation


class VideoFormatOptionRepo {
    
    private static let options : [VideoFormatOption] = [
        VideoFormatOption(id: Formats.FORMAT_MP4, title: "MP4", extensions: ".mp4", isPremium: false, isSelected: true),
        VideoFormatOption(id: Formats.FORMAT_MKV, title: "MKV", extensions: ".mkv", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_MOV, title: "MOV", extensions: ".mov", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_3GP, title: "3GP", extensions: ".3gp", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_FLV, title: "FLV", extensions: ".flv", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_MTS, title: "MTS", extensions: ".mts", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_AVI, title: "AVI", extensions: ".avi", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_TS, title: "TS", extensions: ".ts", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_M4V, title: "M4V", extensions: ".m4v", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_WEBM, title: "WEBM", extensions: ".webm", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_M2TS, title: "M2TS", extensions: ".m2ts", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_MPG, title: "MPG", extensions: ".mpg", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_MPEG, title: "MPEG", extensions: ".mpeg", isPremium: true, isSelected: false),
        VideoFormatOption(id: Formats.FORMAT_WMV, title: "WMV", extensions: ".wmv", isPremium: true, isSelected: false),
    ]
    
    static func getOptions() -> [VideoFormatOption] {
        return options
    }
}
