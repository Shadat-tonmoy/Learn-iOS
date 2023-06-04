//
//  VideoPickerViewModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import Foundation

class VideoPickerViewModel : ObservableObject {
    
    @Published var selectedVideos : [VideoFile] = []
    @Published var totalSelectionText : String = ""
    
    func updateVideoFileSelectin(videoFile : VideoFile) {
        if videoFile.selected {
            selectedVideos.append(videoFile)
        } else {
            selectedVideos.removeAll(where: { file in
                file.id == videoFile.id
            })
        }
        
        updateTotalSelectionText()
    }
    
    private func updateTotalSelectionText() {
        let totalSelectedFile = selectedVideos.count
        var totalSize : Int64 = 0
        selectedVideos.forEach { videoFile in
            totalSize += videoFile.fileSize
        }
        let fileSizeString = Utils.getHumanRedableFileSize(totalSize)
        totalSelectionText = "\(totalSelectedFile) (\(fileSizeString))"
    }
    
    func hasSelectedVideos() -> Bool {
        return selectedVideos.count > 0
    }
    
    func clearSelectedVideos() {
        selectedVideos.forEach{ videoFile in
            videoFile.selected  = false
        }
        selectedVideos = []
    }
    
    
}
