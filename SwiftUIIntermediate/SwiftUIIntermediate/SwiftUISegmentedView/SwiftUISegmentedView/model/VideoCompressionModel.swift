//
//  VideoCompressionModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import Foundation

class QuickCompressOption : Identifiable, ObservableObject {
    
    var id: Int
    var title: String
    var description: String
    var resolutionScaleFactor: Double
    var bitRateThreshold: Int
    var frameRateThreshold: Double
    var isSelected: Bool = false
    
    init(id: Int, title: String, description: String, resolutionScaleFactor: Double, bitRateThreshold: Int, frameRateThreshold: Double, isSelected : Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.resolutionScaleFactor = resolutionScaleFactor
        self.bitRateThreshold = bitRateThreshold
        self.frameRateThreshold = frameRateThreshold
        self.isSelected = isSelected
    }
    
    func toggleSelection(){
        isSelected.toggle()
    }
}
