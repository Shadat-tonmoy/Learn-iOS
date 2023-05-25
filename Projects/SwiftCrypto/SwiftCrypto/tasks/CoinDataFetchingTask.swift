//
//  CoinDataFetchingTask.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/24/23.
//

import SwiftUI
import Combine

class CoinDataFetchingTask {
    
    @Published var allCoins : [CoinModel] = []
    
    var coinSubscription : AnyCancellable?
    
    init(){
        fetchAllCoins()
        
    }
    
    private func fetchAllCoins(){
        print("Fetch All Coins Called")
        
        let apiUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid url")
            return
        }
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.completionHandler,
                  receiveValue: { [weak self] (coins) in
                self?.allCoins = coins
                self?.coinSubscription?.cancel()
            })
    }
}
