//
//  VideoCompressionOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import Foundation


class QuickCompressionOptionRepo {
    
    private static let options : [QuickCompressOption] = [
        QuickCompressOption(id: IDs.QUICK_COMPRESS_LOW,
                            title: "Small File",
                            description: "Acceptable Quality & Resolution. (30% of Original Resolution)",
                            resolutionScaleFactor: 0.33,
                            bitRateThreshold: 500000,
                            frameRateThreshold: 12.0,
                            isSelected: false),
        
        QuickCompressOption(id: IDs.QUICK_COMPRESS_MID,
                            title: "Medium File",
                            description: "Good Quality & Resolution. (50% of Original Resolution)",
                            resolutionScaleFactor: 0.50,
                            bitRateThreshold: 1000000,
                            frameRateThreshold: 24.0,
                            isSelected: true),
        
        QuickCompressOption(id: IDs.QUICK_COMPRESS_HIGH,
                            title: "Large File",
                            description: "Best Quality & Resolution (75% of Original Resolution).",
                            resolutionScaleFactor: 0.75,
                            bitRateThreshold: 1000000,
                            frameRateThreshold: 32.0,
                            isSelected: false)
    ]
    
    
    static func getOptions() -> [QuickCompressOption]{
        return options
    }
}
