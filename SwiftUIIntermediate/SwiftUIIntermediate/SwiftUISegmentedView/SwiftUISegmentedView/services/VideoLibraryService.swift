////
////  VideoLibraryService.swift
////  SwiftUISegmentedView
////
////  Created by Shadat Tonmoy on 5/16/23.
////
//
//import Foundation
//import Photos
//import UIKit
//
//
//class VideoLibraryService : ObservableObject{
//
//    var authorizationStatus : PHAuthorizationStatus = .notDetermined
//
//    @Published var results = PHFetchResultCollection(fetchResult: .init())
//
//    var imageCachingManager = PHCachingImageManager()
//
//    func requestAuthorization() {
//        /// This is the code that does the permission requests
//        PHPhotoLibrary.requestAuthorization { [weak self] status in
//            self?.authorizationStatus = status
//            /// We can determine permission granted by the status
//            switch status {
//                /// Fetch all photos if the user granted us access
//                /// This won't be the photos themselves but the
//                /// references only.
//            case .authorized, .limited:
//                self?.fetchAllPhotos()
//
//                /// For denied response, we should show an error
//            case .denied, .notDetermined, .restricted:
//                print("Authorization denied")
////                handleError?(.restrictedAccess)
//
//            @unknown default:
//                break
//            }
//        }
//    }
//
//
//    private func fetchAllPhotos() {
//        imageCachingManager.allowsCachingHighQualityImages = false
//        let fetchOptions = PHFetchOptions()
//        fetchOptions.includeHiddenAssets = false
//        fetchOptions.sortDescriptors = [
//            NSSortDescriptor(key: "creationDate", ascending: false)
//        ]
//        DispatchQueue.main.async {
//            self.results.fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
//        }
//    }
//
//    func fetchImage(
//            byLocalIdentifier localId: PHAssetLocalIdentifier,
//            targetSize: CGSize = PHImageManagerMaximumSize,
//            contentMode: PHImageContentMode = .default
//        ) async throws -> UIImage? {
//            let results = PHAsset.fetchAssets(
//                withLocalIdentifiers: [localId],
//                options: nil
//            )
//            guard let asset = results.firstObject else {
//                throw QueryError.phAssetNotFound
//            }
//            let options = PHImageRequestOptions()
//            options.deliveryMode = .opportunistic
//            options.resizeMode = .fast
//            options.isNetworkAccessAllowed = true
//            options.isSynchronous = true
//            return try await withCheckedThrowingContinuation { [weak self] continuation in
//                /// Use the imageCachingManager to fetch the image
//                self?.imageCachingManager.requestImage(
//                    for: asset,
//                    targetSize: targetSize,
//                    contentMode: contentMode,
//                    options: options,
//                    resultHandler: { image, info in
//                        /// image is of type UIImage
//                        if let error = info?[PHImageErrorKey] as? Error {
//                            continuation.resume(throwing: error)
//                            return
//                        }
//                        continuation.resume(returning: image)
//                    }
//                )
//            }
//        }
//}
//
//
//struct PHFetchResultCollection: RandomAccessCollection, Equatable {
//
//    typealias Element = PHAsset
//    typealias Index = Int
//
//    var fetchResult: PHFetchResult<PHAsset>
//
//    var endIndex: Int { fetchResult.count }
//    var startIndex: Int { 0 }
//
//    subscript(position: Int) -> PHAsset {
//        fetchResult.object(at: fetchResult.count - position - 1)
//    }
//}
