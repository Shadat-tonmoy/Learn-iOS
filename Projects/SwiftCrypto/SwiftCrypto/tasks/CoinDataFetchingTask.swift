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
    @Published var marketData : MarketDataModel? = nil
    @Published var coinDetails : CoinDetailsModel? = nil
    
    var coinSubscription : AnyCancellable?
    var globalDataSubscription : AnyCancellable?
    var coinDetailSubscription : AnyCancellable?
    
    init(){
        fetchAllCoins()
        fetchMarketData()
        
    }
    
    func fetchAllCoins(){
        print("Fetch All Coins Called")
        
        let apiUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid url")
            return
        }
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder()) // decoding in background thread
            .receive(on: DispatchQueue.main) // switch to main thread
            .sink(receiveCompletion: NetworkManager.completionHandler,
                  receiveValue: { [weak self] (coins) in
                self?.allCoins = coins
                self?.coinSubscription?.cancel()
            })
    }
    
    func fetchMarketData() {
        print("Fetch Market Data Called")
        
        let apiUrl = "https://api.coingecko.com/api/v3/global"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid url")
            return
        }
        
        globalDataSubscription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { data in
                print("Received Data Successfully as \(data)")
            }, receiveValue: { [weak self] (globalData : GlobalData) in
                self?.marketData = globalData.data
                self?.globalDataSubscription?.cancel()
            })
            
    }
    
    func fetchCoinDetails(coinId : String) {
        print("Fetch coin details...")
        
        let apiUrl = "https://api.coingecko.com/api/v3/coins/\(coinId)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
        
        guard
            let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }
        
        print("Fetch coin details api : \(apiUrl)")
        
        coinDetailSubscription = NetworkManager.download(url: url)
            .decode(type: CoinDetailsModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { data in
                
            }, receiveValue: { [weak self] (coinDetailModel : CoinDetailsModel) in
                self?.coinDetails = coinDetailModel
                self?.coinDetailSubscription?.cancel()
                print("Coin Details is : \(self?.coinDetails)")
            })
        
        
    }
}
