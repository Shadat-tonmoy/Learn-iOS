//
//  VideoCompressionModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import Foundation

class QuickCompressOption : Identifiable {
    
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



class VideoFormatOption : Identifiable{
    var id : Int
    var title : String
    var extensions : String
    var isPremium : Bool
    var isSelected : Bool
    
    init(id: Int, title: String, extensions: String, isPremium: Bool, isSelected: Bool) {
        self.id = id
        self.title = title
        self.extensions = extensions
        self.isPremium = isPremium
        self.isSelected = isSelected
    }
    
    func toggleSelection(){
        isSelected.toggle()
    }
}


class VideoCodecOption : Identifiable {
    var id: Int
    var title: String
    var titleTrimmed: String
    var value: String
    var isSelected: Bool
    
    init(id: Int, title: String, titleTrimmed: String, value: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.titleTrimmed = titleTrimmed
        self.value = value
        self.isSelected = isSelected
    }
    
    func toggleSelection(){
        isSelected.toggle()
    }
    
}


class ProcessingSpeedOption : Identifiable {
    
    var id: Int
    var title: String
    var subTitle: String
    var value: String
    var isSelected: Bool
    
    init(id: Int, title: String, subTitle: String, value: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.value = value
        self.isSelected = isSelected
    }
    
    func toggleSelection(){
        isSelected.toggle()
    }
    
}

class CommonFileSize : Identifiable {
    var id : Int
    var title : String
    var valueInMB : Double
    
    init(id: Int, title: String, valueInMB: Double) {
        self.id = id
        self.title = title
        self.valueInMB = valueInMB
    }
}
