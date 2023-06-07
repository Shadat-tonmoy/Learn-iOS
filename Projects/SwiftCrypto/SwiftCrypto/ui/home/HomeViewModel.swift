//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI
import Combine
import CoreData

class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    @Published var marketData : MarketDataModel? = nil
    @Published var isLoading : Bool = false
    private var cancellables : Set<AnyCancellable> = Set()
    
    @Published var statModelList : [StatisticModel] = [
        StatisticModel(title: "Market Cap", value: "12.58Bn", percentageChange: 25.34),
        StatisticModel(title: "Total Assets", value: "7.98Tn", percentageChange: -25.34),
        StatisticModel(title: "Market Cap", value: "12.58Bn")
        
    ]
    
    
    var coinDataFetchingTask : CoinDataFetchingTask = CoinDataFetchingTask()
    var portfolioDataFetchingTask : PortfolioDataFetchingTask = PortfolioDataFetchingTask()
    
    init(){
        initSubscriber()
    }
    
    private func initSubscriber(){
        coinDataFetchingTask.$allCoins.sink(receiveValue: { [weak self] coins in
            self?.allCoins = coins
            
        })
        .store(in: &cancellables)
        
        $searchText
            .combineLatest(coinDataFetchingTask.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterCoin)
            .sink(receiveValue: { [weak self] (filteredCoinList : [CoinModel]) in
                self?.allCoins = filteredCoinList
            })
            .store(in: &cancellables)
        
        
        $allCoins
            .combineLatest(portfolioDataFetchingTask.$savedEntities)
            .map(convertPortfolioCoinsToCoinModel)
            .sink { [weak self] (coinModels : [CoinModel]) in
                self?.portfolioCoins = coinModels
            }
            .store(in: &cancellables)
        
        
        coinDataFetchingTask.$marketData
            .combineLatest($portfolioCoins)
            .map(convertMarketDataToStats)
            .sink(receiveValue: { [weak self] statList in
                self?.statModelList = statList
                self?.isLoading = false
                
            })
            .store(in: &cancellables)
        
        
            
    }
    
    private func convertMarketDataToStats(marketData : MarketDataModel?, portfolioCoins : [CoinModel] ) -> [StatisticModel] {
        
        var stats : [StatisticModel] = []
        
        guard let data = marketData else {
            return stats
        }
        
        let portfolioValue = portfolioCoins.map { coinModel in
            coinModel.currentHoldingsValue
        }.reduce(0, +)
        
        let previousValue = portfolioCoins.map { (coinModel) -> Double in
            let currentValue = coinModel.currentHoldingsValue
            let percentChange = (coinModel.priceChangePercentage24H ?? 0) / 100
            let previousValue = (currentValue) / (1+percentChange)
            return previousValue
        }
            .reduce(0,+)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
        
        stats.append(StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd))
        
        stats.append(StatisticModel(title: "24H Volume", value: data.volume))
        stats.append(StatisticModel(title: "BTC Dominant", value: data.btcDominant))
        stats.append(StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWithDecimal(), percentageChange: percentageChange))
        
        return stats
        
    }
    
    private func convertPortfolioCoinsToCoinModel(coinModels : [CoinModel], portfolioEntities : [PortfolioEntity] ) -> [CoinModel] {
        
        coinModels.compactMap { (coin) -> CoinModel? in
            guard let entity = portfolioEntities.first(where: { (portfolioEntity : PortfolioEntity) in
                coin.id == portfolioEntity.id
            }) else {
                return nil
            }
            return coin.updateHoldings(amount: entity.quantity)
        }
        
    }
    
    private func filterCoin(searchText : String, initialCoinList : [CoinModel]) -> [CoinModel] {
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
    
    func updatePortfolio(coinModel : CoinModel, amount : Double){
        portfolioDataFetchingTask.updatePortfolio(coin: coinModel, amount: amount)
    }
    
    func refreshData(){
        isLoading = true
        coinDataFetchingTask.fetchAllCoins()
        coinDataFetchingTask.fetchMarketData()
    }
}
