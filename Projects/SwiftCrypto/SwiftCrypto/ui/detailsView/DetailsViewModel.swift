//
//  DetailsViewModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import Foundation
import Combine


class DetailsViewModel : ObservableObject {
    
    private let coinDataFetchingTask = CoinDataFetchingTask()
    @Published var coinDetails : CoinDetailsModel? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        initSubscribers()
    }
    
    
    private func initSubscribers(){
        coinDataFetchingTask.$coinDetails.sink { [weak self] (coinDetails : CoinDetailsModel?) in
            self?.coinDetails = coinDetails
            print("Coin details fetched successfully as : \(coinDetails)")
        }
        .store(in: &cancellables)
    }
    
    func fetchCoinDetails(coinId : String){
        print("Will fetch coin details of id : \(coinId)")
        coinDataFetchingTask.fetchCoinDetails(coinId: coinId)
    }
    
    
    
}
