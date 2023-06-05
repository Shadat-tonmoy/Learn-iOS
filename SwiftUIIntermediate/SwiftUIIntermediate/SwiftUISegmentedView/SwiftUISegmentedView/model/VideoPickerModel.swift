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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case createdAt = "createdAt"
        case modifiedAt = "modifiedAt"
        case fileSize = "fileSize"
        case selected = "selected"
    }
    
}
