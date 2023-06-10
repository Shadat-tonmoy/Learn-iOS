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
    @Published var showFiteToFIleSizeOption = false
    
    @Published var videoPropertyOption = Values.NONE
    
    @Published var selectedFormat : VideoFormatOption = VideoFormatOptionRepo.getDefaultOption()
    @Published var selectedCodec : VideoCodecOption = VideoCodecOptionRepo.getDefaultOption()
    @Published var selectedSpeed : ProcessingSpeedOption = ProcessingSpeedOptionRepo.getDefaultOption()
    @Published var selectedSocialMediaOption : SocialMediaOption = SocialMediaOptionRepo.getDefaultOption()
    @Published var volumePercentage = 100
    
    var tabs : [String] = ["Quick", "Resolution", "Quality"]
    
    @Published var selectedVideos : [VideoFile] = []
    
    
    @Published var isPercentage = true
    @Published var isFixedValue = false
    
    @Published var frameRatePercentage = 100.0
    @Published var resolutionRatePercentage = 100.0
    @Published var bitRatePercentage = 100.0
    
    
    @Published var frameRateValue = 100.0
    @Published var resolutionRateValue = 100.0
    @Published var bitRateValue = 100.0
    
    @Published var showFixedFrameRateOption = false
    @Published var showFixedBitRateOption = false
    @Published var showFixedResolutionOption = false
    
    func getSelectedVideos() {
        
        guard
            let data = UserDefaults.standard.data(forKey: Tags.SELECTED_VIDEOS),
            let decodedData = try? JSONDecoder().decode([VideoFile].self, from: data)
        else {
            print("Error Fetching Selected Video List")
            return
        }
        
        print("Decoded Data : \(decodedData)")
        self.selectedVideos = decodedData
    }
    
    
    func getQuickCompressionOptions() -> [QuickCompressOption] {
        return QuickCompressionOptionRepo.options
    }
    
    func updateQuickCompressionSelectedOption(selectedOption : QuickCompressOption) {
        QuickCompressionOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        SocialMediaOptionRepo.selectNone()
        objectWillChange.send()
    }
    
    func getResolutionCompressionOptions() -> [ResolutionCompressionOption] {
        return ResolutionOptionRepo.getOptions()
    }
    
    func updateResolutionCompressionSelectedOption(selectedOption : ResolutionCompressionOption) {
        ResolutionOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        objectWillChange.send()
    }
    
    func getFormatOptions() -> [VideoFormatOption] {
        return VideoFormatOptionRepo.getOptions()
    }
    
    func updateSelectedFormat(selectedOption : VideoFormatOption) {
        VideoFormatOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        selectedFormat = selectedOption
        objectWillChange.send()
    }
    
    func getCodecOptions() -> [VideoCodecOption] {
        return VideoCodecOptionRepo.getOptions()
    }
    
    func updateSelectedCodecOption(selectedOption : VideoCodecOption) {
        VideoCodecOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        selectedCodec = selectedOption
        objectWillChange.send()
    }
    
    func getProcessingSpeedOptions() -> [ProcessingSpeedOption] {
        return ProcessingSpeedOptionRepo.getOptions()
    }
    
    func updateSelectedProcessingSpeedOption(selectedOption : ProcessingSpeedOption) {
        ProcessingSpeedOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        selectedSpeed = selectedOption
        objectWillChange.send()
    }
    
    func getSocialMediaOptions() -> [SocialMediaOption] {
        return SocialMediaOptionRepo.getOptions()
    }
    
    func updateSelectedSocialMediaOption(selectedOption : SocialMediaOption) {
        SocialMediaOptionRepo.updateSelectedOption(selectedOption: selectedOption)
        selectedSocialMediaOption = selectedOption
        QuickCompressionOptionRepo.selectNone()
        objectWillChange.send()
    }
    
    func getSelectedTabView() -> AnyView {
        if(selectedTab == Constans.quickCompression) {
            return AnyView(QuickCompressionView(viewModel: self))
        } else if(selectedTab == Constans.resolutionCompression) {
            return AnyView(ResolutionCompressionView(viewModel: self))
        } else if(selectedTab == Constans.qualityCompression){
            return AnyView(QualityCompressionView(viewModel: self))
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
    
    func hideFormatOptions() {
        showFormatOptions = false
    }
    
    func hideCodecOptions() {
        showCodecOptions = false
    }
    
    func hideSpeedOptions() {
        showSpeedOptions = false
    }
    
    func hideVolumeOptions() {
        showAdjustVolumeOption = false
    }
    
    func hideFiteToFileSizeOptions() {
        showFiteToFIleSizeOption = false
    }
    
    func getFixedValueFrameRateOptionList() -> [FrameRateOption] {
        return VideoFrameRateOptionRepo.getOptions()
    }
    
    func getFixedValueBitRateOptionList() -> [BitRateOption] {
        return VideoBitRateOptionRepo.getOptions()
    }
    
    func getFixedValueResolutionOptionList() -> [ResolutionOption] {
        return VideoResolutionOptionRepo.getOptions()
    }
    
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
