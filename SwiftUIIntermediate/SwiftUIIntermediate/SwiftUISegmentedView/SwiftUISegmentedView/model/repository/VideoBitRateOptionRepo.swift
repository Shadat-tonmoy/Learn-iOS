//
//  VideoBitRateOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import Foundation


class VideoBitRateOptionRepo {
    
    private static let options : [BitRateOption] = [
        BitRateOption(id: IDs.BIT_RATE_CUSTOM, title: "Set Custom Value", range: "", valueInKBPS: IDs.BIT_RATE_CUSTOM),
        BitRateOption(id: IDs.BIT_RATE_ORIGINAL, title: "Original", range: "", valueInKBPS: IDs.BIT_RATE_ORIGINAL, isSelected: true),
        BitRateOption(id: IDs.BIT_RATE_MEDIUM, title: "Medium", range: "(800~1200 Kbps)", valueInKBPS: 1000),
        BitRateOption(id: IDs.BIT_RATE_GOOD, title: "Good", range: "(1500~2000 Kbps)", valueInKBPS: 2000),
        BitRateOption(id: IDs.BIT_RATE_HIGH, title: "High", range: "(2000~3000 Kbps)", valueInKBPS: 3000),
        BitRateOption(id: IDs.BIT_RATE_HD, title: "HD", range: "(3000~4000 Kbps)", valueInKBPS: 4000),
    ]
    
    
    static func getOptions() -> [BitRateOption] {
        return options
    }
    
    
    static func getBitRateOptionById(id: Int) -> BitRateOption {
        
        for option in options {
            if option.id == id {
                return option
            }
        }
        return getOriginalBitRateOption()
    }
    
    static func getOriginalBitRateOption() -> BitRateOption {
        return options[1]
    }
    
    static func getCustomBitRateOption() -> BitRateOption {
        return options[0]
    }
    
    static func getCustomBitRateOption(value: Int) -> BitRateOption {
        return BitRateOption(id : IDs.BIT_RATE_CUSTOM, title : "Custom (\(value) Kbps", range: "",valueInKBPS: value)
    }
    
    static func getBitRateOptionByTitle(title: String?) -> BitRateOption {
        for option in options {
            if option.title == title {
                return option
            }
        }
        return getOriginalBitRateOption()
    }
    
    static func getBitRateOptionByValue(valueInKBPS: Int) -> BitRateOption {
        for option in options {
            if option.valueInKBPS == valueInKBPS {
                return option
            }
        }
        if (valueInKBPS == IDs.BIT_RATE_ORIGINAL) {
            return getOriginalBitRateOption()
        }
        else if (valueInKBPS == IDs.BIT_RATE_CUSTOM) {
            return getOriginalBitRateOption()
        }
        else {
            return getCustomBitRateOption(value : valueInKBPS)
        }
        
    }
    
    
}
