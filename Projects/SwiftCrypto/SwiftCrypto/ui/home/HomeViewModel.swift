//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI
import Combine

class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    private var cancellables : Set<AnyCancellable> = Set()
    
    
    var coinDataFetchingTask : CoinDataFetchingTask = CoinDataFetchingTask()
    
    init(){
        initSubscriber()
    }
    
    private func initSubscriber(){
        coinDataFetchingTask.$allCoins.sink(receiveValue: { [weak self] coins in
            self?.allCoins = coins
            
        })
        .store(in: &cancellables)
        
        $searchText.combineLatest(coinDataFetchingTask.$allCoins)
            .map { (searchText : String, initialCoinList : [CoinModel]) -> [CoinModel] in
                guard
                    !searchText.isEmpty else {
                    return initialCoinList
                }
                
                let searchTextLower = searchText.lowercased()
                
                let filteredList = initialCoinList.filter { (coin : CoinModel) -> Bool in
                    coin.name.lowercased().contains(searchTextLower) ||
                    coin.symbol.lowercased().contains(searchTextLower)
                }
                
                return filteredList
                
                
            }
            .sink(receiveValue: { [weak self] (filteredCoinList : [CoinModel]) in
                self?.allCoins = filteredCoinList
            })
            .store(in: &cancellables)
    }
}
