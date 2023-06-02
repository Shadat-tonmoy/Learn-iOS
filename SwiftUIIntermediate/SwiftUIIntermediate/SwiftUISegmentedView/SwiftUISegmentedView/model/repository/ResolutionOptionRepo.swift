//
//  ResolutionOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/18/23.
//

import Foundation

class ResolutionOptionRepo {
    
    private static let options : [ResolutionCompressionOption] = [
        ResolutionCompressionOption(id: IDs.RESOLUTION_CUSTOM, title: "Custom", subtitle: "Set custom width and height", isSelected: false),
        ResolutionCompressionOption(id: IDs.RESOLUTION_240P, title: "240P", subtitle: "Lowest Quality and Resolution, Smallest File Size", isSelected: false),
        ResolutionCompressionOption(id: IDs.RESOLUTION_360P, title: "360P", subtitle: "Low Quality and Resolution, Small File Size", isSelected: true),
        ResolutionCompressionOption(id: IDs.RESOLUTION_480P, title: "480P", subtitle: "Medium Quality and Resolution, Medium File Size", isSelected: false),
        ResolutionCompressionOption(id: IDs.RESOLUTION_720P, title: "720P", subtitle: "High Quality and Resolution, Large File Size", isSelected: false),
        ResolutionCompressionOption(id: IDs.RESOLUTION_1080P, title: "1080P", subtitle: "Highest Quality and Resolution, Large File Size", isSelected: false)
    ]
    
    static func getOptions() -> [ResolutionCompressionOption]{
        return options
    }
    
    static func updateSelectedOption(selectedOption : ResolutionCompressionOption) {
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
