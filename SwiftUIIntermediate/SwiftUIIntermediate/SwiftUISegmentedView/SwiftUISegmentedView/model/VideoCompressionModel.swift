//
//  VideoCompressionModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import Foundation

struct QuickCompressOption : Identifiable, Hashable{
    var id: Int
    var title: String
    var description: String
    var resolutionScaleFactor: Double
    var bitRateThreshold: Int
    var frameRateThreshold: Double
    var isSelected: Bool = false
}
