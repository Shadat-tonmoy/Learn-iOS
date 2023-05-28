//
//  FastCompressionViewModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/27/23.
//

import SwiftUI

class FastCompressionViewModel : ObservableObject {
    
    @Published var selectedTab = 0
    
    @Published var showFormatOptions = false
    @Published var showCodecOptions = false
    @Published var showSpeedOptions = false
    
    var tabs : [String] = ["Quick", "Resolution", "Quality"]
    
    
    func getQuickCompressionOptions() -> [QuickCompressOption] {
        return QuickCompressionOptionRepo.options
    }
    
    func updateSelectedOption(selectedOption : QuickCompressOption) {
        QuickCompressionOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        objectWillChange.send()
    }
    
    func getSelectedTabView() -> AnyView {
        if(selectedTab == Constans.quickCompression) {
            return AnyView(QuickCompressionView(viewModel: self))
        } else if(selectedTab == Constans.resolutionCompression) {
            return AnyView(ResolutionCompressionView())
        } else if(selectedTab == Constans.qualityCompression){
            return AnyView(QualityCompressionView())
        } else {
            return AnyView(EmptyView())
        }
    }
    
    
}
