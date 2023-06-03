//
//  VideoLibraryService.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/16/23.
//

import Foundation
import Photos
import UIKit


class VideoLibraryService : ObservableObject{
    
    var authorizationStatus : PHAuthorizationStatus = .notDetermined
    
    var results = PHFetchResultCollection(fetchResult: .init())
    @Published var videoFiles : [VideoFile] = []
    
    var imageCachingManager = PHCachingImageManager()
    
    func requestAuthorization() {
        /// This is the code that does the permission requests
        PHPhotoLibrary.requestAuthorization { status in
            /// print("requestAuthorization : status : \(status)")
            self.authorizationStatus = status
            /// We can determine permission granted by the status
            switch status {
                /// Fetch all photos if the user granted us access
                /// This won't be the photos themselves but the
                /// references only.
            case .authorized, .limited:
                /// print("Will fetch all photos, self : \(self)")
                self.fetchAllVideos()
                
                /// For denied response, we should show an error
            case .denied, .notDetermined, .restricted:
                print("Authorization denied")
                /// handleError?(.restrictedAccess)
                
            @unknown default:
                break
            }
        }
    }
    
    
    func fetchAllVideos() {
        imageCachingManager.allowsCachingHighQualityImages = false
        let fetchOptions = PHFetchOptions()
        fetchOptions.includeHiddenAssets = false
        fetchOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        DispatchQueue.main.async {
            self.results.fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions)
            
            let totalVideo = self.results.fetchResult.count
            var list : [VideoFile] = []
            for i in 0..<totalVideo {
                let video = self.results.fetchResult[i]
                let localId = video.localIdentifier
                let fileSize = self.getAssetFileSize(asset: video)
                let fileName = self.getAssetFileName(asset: video)
                let videoFile = VideoFile(id: localId, title: fileName, width: video.pixelWidth, height: video.pixelHeight, duration: video.duration, createdAt: video.creationDate?.timeIntervalSince1970.magnitude ?? 0, modifiedAt: video.modificationDate?.timeIntervalSince1970.magnitude ?? 0, fileSize: fileSize)
                list.append(videoFile)
                
            }
            self.videoFiles = list
        }
    }
    
    private func getAssetFileSize(asset : PHAsset) -> Int64{
        let resources = PHAssetResource.assetResources(for: asset) // your PHAsset
        
        var sizeOnDisk: Int64? = 0
        
        if let resource = resources.first {
            let unsignedInt64 = resource.value(forKey: "fileSize") as? CLong
            sizeOnDisk = Int64(bitPattern: UInt64(unsignedInt64!))
            return sizeOnDisk ?? 0
            
        }
        
        return 0
    }
    
    private func getAssetFileName(asset : PHAsset) -> String {
        let resources = PHAssetResource.assetResources(for: asset) // your PHAsset
        return resources.first?.originalFilename ?? ""
    }
    
    private func getVideoDurationString(asset : PHAsset) -> String{
        print(asset.duration)
        return "\(asset.pixelWidth)x\(asset.pixelHeight)"
    }
    
    
    private func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    
    
}


struct PHFetchResultCollection: RandomAccessCollection, Equatable {
    
    typealias Element = PHAsset
    typealias Index = Int
    
    var fetchResult: PHFetchResult<PHAsset>
    
    var endIndex: Int { fetchResult.count }
    var startIndex: Int { 0 }
    
    subscript(position: Int) -> PHAsset {
        fetchResult.object(at: fetchResult.count - position - 1)
    }
}
