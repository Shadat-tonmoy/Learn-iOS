//
//  CoinImageViewModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/25/23.
//

import SwiftUI
import Combine

class CoinImageViewModel : ObservableObject{
    
    
    @Published var coinImage : UIImage? = nil
    @Published var isLoading : Bool = false
    var imageRequest : AnyCancellable?
    let localFileManager = LocalFileManager.instance
    let coin : CoinModel
    let cachedImageFolderName = "CachedImage"
    
    init(coin : CoinModel) {
        self.coin = coin
        getImage()
    }
    
    func getImage() {
        guard
            let localImage = localFileManager.getImageFromFileManager(fileName: coin.id, folderName: cachedImageFolderName) else {
            downloadImage(urlString: coin.image)
            return
        }
        print("Setting Image From Local...")
        coinImage = localImage
    }
    
    private func downloadImage(urlString : String) {
        print("Downloading Image...")
        isLoading = true
        guard let url = URL(string: urlString) else {
            return
        }
        
        imageRequest = NetworkManager.download(url: url)
            .tryMap { data in
                UIImage(data: data)
            }
            .receive(on: DispatchQueue.main) // switch to main thread to receive data 
            .sink(receiveCompletion: NetworkManager.completionHandler, receiveValue: { [weak self] image in
                guard let uiImage = image else {
                    return
                }
                if let validSelf = self {
                    validSelf.localFileManager.saveImage(image: uiImage,
                                                         fileName: validSelf.coin.id,
                                                         folderName: validSelf.cachedImageFolderName)
                }
                
                self?.isLoading = false
                self?.coinImage = uiImage
                self?.imageRequest?.cancel()
            })
        
        
    }
    
}
