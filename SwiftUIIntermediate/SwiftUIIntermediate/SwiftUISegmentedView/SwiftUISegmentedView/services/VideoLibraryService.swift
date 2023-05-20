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
    
    @Published var results = PHFetchResultCollection(fetchResult: .init())
    
    var imageCachingManager = PHCachingImageManager()
    
    func requestAuthorization() {
        /// This is the code that does the permission requests
        PHPhotoLibrary.requestAuthorization { status in
//            print("requestAuthorization : status : \(status)")
            self.authorizationStatus = status
            /// We can determine permission granted by the status
            switch status {
                /// Fetch all photos if the user granted us access
                /// This won't be the photos themselves but the
                /// references only.
            case .authorized, .limited:
//                print("Will fetch all photos, self : \(self)")
                self.fetchAllPhotos()
                
                /// For denied response, we should show an error
            case .denied, .notDetermined, .restricted:
                print("Authorization denied")
                //                handleError?(.restrictedAccess)
                
            @unknown default:
                break
            }
        }
    }
    
    
    func fetchAllPhotos() {
//        print("Fetch All Photos Called!")
        imageCachingManager.allowsCachingHighQualityImages = false
        let fetchOptions = PHFetchOptions()
        fetchOptions.includeHiddenAssets = false
        fetchOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        DispatchQueue.main.async {
            self.results.fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions)
//            let totalVideo = self.results.fetchResult.count
//            for i in 0..<totalVideo {
//                let video = self.results.fetchResult[i]
//                print("Video : \(video)")
//                self.getAssetFileSize(asset: video)
//
//            }
//            print("Total found image : \(self.results.fetchResult.count)")
            
            
        }
    }
    
    func getAssetFileSize(asset : PHAsset) -> String{
        let resources = PHAssetResource.assetResources(for: asset) // your PHAsset
        
        var sizeOnDisk: Int64? = 0
        
        if let resource = resources.first {
            let unsignedInt64 = resource.value(forKey: "fileSize") as? CLong
            sizeOnDisk = Int64(bitPattern: UInt64(unsignedInt64!))
            if let size = sizeOnDisk {
                let humanReadableSize = converByteToHumanReadable(size)
                return humanReadableSize
            }
            
        }
        
        return ""
    }
    
    func getVideoDurationString(asset : PHAsset) -> String{
        print(asset.duration)
        return "\(asset.pixelWidth)x\(asset.pixelHeight)"
    }
    
    
    func converByteToHumanReadable(_ bytes:Int64) -> String {
        let formatter:ByteCountFormatter = ByteCountFormatter()
        formatter.countStyle = .binary
        
        return formatter.string(fromByteCount: Int64(bytes))
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
//        print("Returning thumb for : \(asset.localIdentifier)")
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
