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
    private var cancellables = Set<AnyCancellable>()
    
    @Published var coinDetails : CoinDetailsModel? = nil
    @Published var coinModel : CoinModel? = nil
    @Published var overviewStats : [StatisticModel] = []
    @Published var additionalStats : [StatisticModel] = []
    
    
    
    
    init(coinModel : CoinModel) {
        self.coinModel = coinModel
        initSubscribers()
        fetchCoinDetails(coinId: coinModel.id)
    }
    
    
    private func initSubscribers(){
        coinDataFetchingTask.$coinDetails
            .combineLatest($coinModel)
            .map({(coinDetailModel, coinModel) -> (overview : [StatisticModel], additional : [StatisticModel]) in
                
                print("coin model from map : \(coinModel)")
                
                let overviewArray : [StatisticModel] = self.getOverviewArray(coinModel: coinModel)
                
                let additionalArray : [StatisticModel] = self.getAdditionalInfoArray(coinModel: coinModel, coinDetailModel: coinDetailModel)
                
                
                return (overviewArray,additionalArray)
            })
            .sink { [weak self] (returnedArrays) in
                self?.overviewStats = returnedArrays.overview
                self?.additionalStats = returnedArrays.additional
//                print("OverviewStats : \(self?.overviewStats), additionalStats : \(self?.additionalStats)")
            }
            .store(in: &cancellables)
    }
    
    
    func getOverviewArray(coinModel : CoinModel?) -> [StatisticModel] {
        
        let price = coinModel?.currentPrice.asCurrencyWithDecimal() ?? "N/A"
        let priceChange = coinModel?.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: priceChange)
        
        let marketCap = coinModel?.marketCap?.asCurrencyWithDecimal() ?? "N/A"
        let marketCapChange = coinModel?.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapChange)
        
        let rank = (coinModel?.rank == nil ? "N/A" : "\(coinModel?.rank)")
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = coinModel?.totalVolume?.formattedWithAbbreviations() ?? "N/A"
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        let overviewArray : [StatisticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray
        
    }
    
    func getAdditionalInfoArray(coinModel : CoinModel?, coinDetailModel : CoinDetailsModel?) -> [StatisticModel] {
        
        let high = coinModel?.high24H?.asCurrencyWithDecimal() ?? "N/A"
        let highStat = StatisticModel(title: "24H High", value: high)
        
        let low = coinModel?.low24H?.asCurrencyWithDecimal() ?? "N/A"
        let lowStat = StatisticModel(title: "24H Low", value: low)
        
        let priceChange24H = coinModel?.priceChange24H?.asCurrencyWithDecimal() ?? "N/A"
        let priceChange24HPercentage = coinModel?.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change", value: priceChange24H, percentageChange: priceChange24HPercentage)
        
        let marketCapChange24H = coinModel?.marketCapChange24H?.asCurrencyWithDecimal() ?? "N/A"
        let marketCapChange24HPercentage = coinModel?.marketCapChangePercentage24H
        let marketCap24HStat = StatisticModel(title: "24H Market Cap Change", value: marketCapChange24H, percentageChange: marketCapChange24HPercentage)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "N/A" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "N/A"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray : [StatisticModel] = [
            highStat,lowStat,priceChangeStat,marketCap24HStat,blockStat,hashingStat
        ]
        
        return additionalArray
    }
    
    func fetchCoinDetails(coinId : String){
        print("Will fetch coin details of id : \(coinId)")
        coinDataFetchingTask.fetchCoinDetails(coinId: coinId)
    }
    
    
    
}