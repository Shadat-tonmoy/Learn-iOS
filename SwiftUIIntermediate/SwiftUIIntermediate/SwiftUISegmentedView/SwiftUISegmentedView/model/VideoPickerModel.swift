//
//  VideoPickerModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/27/23.
//

import Foundation
import SwiftUI
import UIKit
import Photos


class VideoFile : Identifiable, Codable {
    
    let id : String
    let title : String
    let width : Int
    let height : Int
    let duration : Double
    let createdAt : Double
    let modifiedAt : Double
    let fileSize : Int64
    var selected : Bool = false
    var originalVideoInfo : VideoInfo? = nil
    var outputVideoInfo : VideoInfo? = nil
    
    init(id: String, title: String, width: Int, height: Int, duration: Double, createdAt: Double, modifiedAt: Double, fileSize: Int64, selected : Bool = false) {
        self.id = id
        self.title = title
        self.width = width
        self.height = height
        self.duration = duration
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.fileSize = fileSize
        self.selected = selected
    }
    
    func json() -> String? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            return json
        } catch let error {
            print("Error encoding data. Error : \(error)")
        }
        return nil
    }
    
    func getFileSize() -> String {
        return Utils.getHumanRedableFileSize(fileSize)
    }
    
    func getFileResolution() -> String {
        return "\(width)x\(height)"
    }
    
    
    
    func getVideoThumbnail() -> UIImage {
        let asset = PHAsset.fetchAssets(withLocalIdentifiers: [id], options: nil).firstObject
        if let videoFile = asset {
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var thumbnail = UIImage()
            option.isSynchronous = true
            manager.requestImage(for: videoFile, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                thumbnail = result!
            })
            return thumbnail
        } else {
            print("getVideoThumbnail, asset is null for localId : \(id)")
            return UIImage(systemName: "photo")!
        }
    }
    
    func getVideoThumbnailAsync() async -> UIImage? {
        return getVideoThumbnail()
    }
    
    func toggleSelection() {
        selected.toggle()
    }
}


class VideoInfo : Identifiable, Codable {
    let videoBitRate: Int
    let videoFrameRate: Double
    let audioBitrate: Int
    let videoCodec: String
    let audioCoded: String
    let audioEncoding: Int
    let audioQuality: Int
    let outputFormat: String
    let speedPreset: String
    let width: Int
    let height: Int
    let videoDuration: Double
    let startTime: Time
    let endTime: Time
    var trimOrCutStatus: Int = Constans.TRIM
    var resolutionPercent: Int = 100
    var videoBitRatePercent: Int = 100
    var videoFrameRatePercent: Int = 100
    var selectedResolution: Int = Constans.RESOLUTION_ORIGINAL
    var quickCompressionType: Int = Constans.INVALID
    var muteVideo: Bool = false
    var volume: Int = 100
    
    init(videoBitRate: Int, videoFrameRate: Double, audioBitrate: Int, videoCodec: String, audioCoded: String, audioEncoding: Int, audioQuality: Int, outputFormat: String, speedPreset: String, width: Int, height: Int, videoDuration: Double, startTime: Time, endTime: Time, trimOrCut : Int = Constans.TRIM, resolutionPercent: Int = 100, videoBitRatePercent: Int = 100, videoFrameRatePercent: Int = 100, selectedResolution: Int = Constans.RESOLUTION_ORIGINAL, quickCompressionType: Int = Constans.INVALID, muteVideo: Bool = false, volume: Int = 100) {
        self.videoBitRate = videoBitRate
        self.videoFrameRate = videoFrameRate
        self.audioBitrate = audioBitrate
        self.videoCodec = videoCodec
        self.audioCoded = audioCoded
        self.audioEncoding = audioEncoding
        self.audioQuality = audioQuality
        self.outputFormat = outputFormat
        self.speedPreset = speedPreset
        self.width = width
        self.height = height
        self.videoDuration = videoDuration
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func getVolumeValue() -> Float{
        return (1.0/100) * Float(volume)
    }
    
    func needToUpdateVolume() -> Bool {
        return !muteVideo && volume > 0
    }
    
}


class Time : Codable {
    let hour: Int
    let minute: Int
    let second: Int
    let milliSecond: Int
    
    init(hour: Int, minute: Int, second: Int, milliSecond: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
        self.milliSecond = milliSecond
    }
    
    func isGreaterThan(anotherTime: Time) -> Bool {
        return milliSecond > anotherTime.milliSecond || second > anotherTime.second || minute > anotherTime.minute || hour > anotherTime.hour
    }
    
    func isLessThan(anotherTime: Time) -> Bool {
        return milliSecond < anotherTime.milliSecond || second < anotherTime.second || minute < anotherTime.minute || hour < anotherTime.hour
    }
    
    func isZero() -> Bool {
        return milliSecond == 0 && second == 0 && minute == 0 && hour == 0
    }
}

