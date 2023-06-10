//
//  VideoResolutionOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import Foundation

class VideoResolutionOptionRepo {
    
    private static let options : [ResolutionOption] = [
        ResolutionOption(title: "Set Custom Value", value: IDs.VIDEO_RESOLUTION_CUSTOM),
        ResolutionOption(title: "Original", value: IDs.VIDEO_RESOLUTION_ORIGINAL, isSelected: true),
        ResolutionOption(title: "1080P", value: 1080),
        ResolutionOption(title: "960P", value: 960),
        ResolutionOption(title: "720P", value: 720),
        ResolutionOption(title: "640P", value: 640),
        ResolutionOption(title: "480P", value: 480),
        ResolutionOption(title: "360P", value: 360),
        ResolutionOption(title: "320P", value: 320),
        ResolutionOption(title: "240P", value: 240),
        
    ]
    
    static func getOptions() -> [ResolutionOption] {
        return options
    }
    
    static func getOriginalResolutionOption() -> ResolutionOption {
        return options[1]
    }
    
    static func getCustomResolutionOption() -> ResolutionOption {
        return options[0]
    }
    
    static func getCustomResolutionOption(value: Int) -> ResolutionOption {
        return ResolutionOption(
            title: "Custon : (\(value)P", value: value
        )
    }
    
    static func getResolutionOptionByTitle(title: String?) -> ResolutionOption {
        for option in options {
            if (option.title == title) {return option}
        }
        return getOriginalResolutionOption()
    }
    
    static func getResolutionOptionByValue(value: Int) -> ResolutionOption {
        for option in options {
            if option.value == value {return option}
        }
        if value == IDs.VIDEO_RESOLUTION_ORIGINAL {return getOriginalResolutionOption()}
        else if value == IDs.VIDEO_RESOLUTION_CUSTOM {return getOriginalResolutionOption()}
        else {return getCustomResolutionOption(value : value)}
        
    }
}
