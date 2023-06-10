//
//  VideoFrameRateOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import Foundation


class VideoFrameRateOptionRepo {
    
    
    private static let options : [FrameRateOption] = [
        FrameRateOption(title: "Set Custom Value", value: IDs.FRAME_RATE_CUSTOM),
        FrameRateOption(title: "Original", value: IDs.FRAME_RATE_ORIGINAL,isSelected: true),
        FrameRateOption(title: "60.0", value: 60.0),
        FrameRateOption(title: "60.0", value: 60.0),
        FrameRateOption(title: "30.0", value: 30.0),
        FrameRateOption(title: "29.7", value: 29.7),
        FrameRateOption(title: "25.0", value: 25.0),
        FrameRateOption(title: "24.0", value: 24.0),
        FrameRateOption(title: "23.9", value: 23.9),
        FrameRateOption(title: "15.0", value: 15.0),
        FrameRateOption(title: "14.9", value: 14.9),
        FrameRateOption(title: "12.5", value: 12.5),
    ]
    
    static func getOptions() -> [FrameRateOption] {
        return options
    }
    
    
    static func getOriginalFrameRateOption() -> FrameRateOption {
        return options[1]
    }
    
    static func getCustomFrameRateOption() -> FrameRateOption {
        return options[0]
    }
    
    static func getCustomFrameRateOption(value: Double) -> FrameRateOption {
        return FrameRateOption(
            title : "Custom (\(value)",
            value : value)
    }
    
    static func getFrameOptionByTitle(title: String?) -> FrameRateOption {
        for option in options {
            if (option.title == title) {
                return option
            }
        }
        return getOriginalFrameRateOption()
    }
    
    static func getFrameOptionByValue(value: Double) -> FrameRateOption {
        for option in options {
            if (option.value == value) {
                return option
            }
        }
        if value == IDs.FRAME_RATE_ORIGINAL {
            return getOriginalFrameRateOption()
        }
        else if value == IDs.FRAME_RATE_CUSTOM {
            return getOriginalFrameRateOption()
        }
        else {
            return getCustomFrameRateOption(value : value)
        }
    }
}
