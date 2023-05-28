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
    @Published var showAdjustVolumeOption = false
    
    @Published var videoPropertyOption = Values.NONE
    
    var tabs : [String] = ["Quick", "Resolution", "Quality"]
    
    
    func getQuickCompressionOptions() -> [QuickCompressOption] {
        return QuickCompressionOptionRepo.options
    }
    
    func getResolutionCompressionOptions() -> [ResolutionCompressionOption] {
        return ResolutionOptionRepo.getOptions()
    }
    
    func updateQuickCompressionSelectedOption(selectedOption : QuickCompressOption) {
        QuickCompressionOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        objectWillChange.send()
    }
    
    func updateResolutionCompressionSelectedOption(selectedOption : ResolutionCompressionOption) {
        ResolutionOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        objectWillChange.send()
    }
    
    func getSelectedTabView() -> AnyView {
        if(selectedTab == Constans.quickCompression) {
            return AnyView(QuickCompressionView(viewModel: self))
        } else if(selectedTab == Constans.resolutionCompression) {
            return AnyView(ResolutionCompressionView(viewModel: self))
        } else if(selectedTab == Constans.qualityCompression){
            return AnyView(QualityCompressionView())
        } else {
            return AnyView(EmptyView())
        }
    }
    
    func updateVideoPropertyOption(value : Int) {
        videoPropertyOption = value
        showFormatOptions = videoPropertyOption == Values.FORMAT_OPTIONS
        showCodecOptions = videoPropertyOption == Values.CODEC_OPTIONS
        showSpeedOptions = videoPropertyOption == Values.SPEED_OPTIONS
    }
    
    
}
