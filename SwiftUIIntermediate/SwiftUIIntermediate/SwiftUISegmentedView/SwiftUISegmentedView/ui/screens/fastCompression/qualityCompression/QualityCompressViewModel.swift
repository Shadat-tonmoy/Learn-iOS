//
//  QualityCompressViewModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import SwiftUI

class QualityCompressViewModel : ObservableObject{
    
    
    @Published var isPercentage = true
    @Published var isFixedValue = false
    
    @Published var frameRatePercentage = 100.0
    @Published var resolutionRatePercentage = 100.0
    @Published var bitRatePercentage = 100.0
    
    
    @Published var frameRateValue = 100.0
    @Published var resolutionRateValue = 100.0
    @Published var bitRateValue = 100.0
    
    func frameRatePercentText() -> String {
        return String(format: "%.0f", frameRatePercentage)
        
    }
    
    func frameRateValueText() -> String {
        return String(format: "%.2f", frameRatePercentage)
        
    }
    
    func bitRateValueText() -> String {
        return String(format: "%.2f", frameRatePercentage)
        
    }
    
    func resolutionValueText() -> String {
        return String(format: "%.2f", frameRatePercentage)
        
    }
    
    func enablePercentageOption() {
        isPercentage = true
        isFixedValue = false
    }
    
    func enableFixedValueOption(){
        isFixedValue = true
        isPercentage = false
        
    }
    
}
