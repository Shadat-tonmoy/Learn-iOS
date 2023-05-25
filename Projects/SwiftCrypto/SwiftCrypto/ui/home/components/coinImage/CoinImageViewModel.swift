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
    
    init(coin : CoinModel) {
        fetchImage(urlString: coin.image)
    }
    
    private func fetchImage(urlString : String) {
        isLoading = true
        guard let url = URL(string: urlString) else {
            return
        }
        
        imageRequest = NetworkManager.download(url: url)
            .tryMap { data in
                UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkManager.completionHandler, receiveValue: { [weak self] image in
                self?.isLoading = false
                guard let uiImage = image else {
                    return
                }
                self?.coinImage = uiImage
                self?.imageRequest?.cancel()
            })
        
        
    }
    
}
