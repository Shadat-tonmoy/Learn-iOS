//
//  ProcessingSpeedOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import Foundation


class ProcessingSpeedOptionRepo {
    
    private static let options : [ProcessingSpeedOption] = [
        ProcessingSpeedOption(id: Speeds.SPEED_NORMAL, title: "Normal", subTitle: "Smallest File Size", value: "veryfast", isSelected: true),
        ProcessingSpeedOption(id: Speeds.SPEED_FAST, title: "Fast", subTitle: "Medium File Size", value: "ultrafast", isSelected: false),
    
    ]
    
    static func getOptions() -> [ProcessingSpeedOption] {
        return options
    }
    
    static func getDefaultOption() -> ProcessingSpeedOption {
        return options[0]
    }
    
    static func updateSelectedOption(selectedOption : ProcessingSpeedOption) {
        options.forEach{ option in
            option.isSelected = option.id == selectedOption.id
        }
    }
    
    static func selectNone(){
        options.forEach{ option in
            option.isSelected = false
        }
    }
}
