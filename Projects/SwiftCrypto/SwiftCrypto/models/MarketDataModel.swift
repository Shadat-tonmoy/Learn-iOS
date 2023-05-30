//
//  MarketDataModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/29/23.
//

import Foundation


/**
 
 URL - https://api.coingecko.com/api/v3/global

 {
   "data": {
     "active_cryptocurrencies": 10201,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 746,
     "total_market_cap": {
       "btc": 43280161.250670604,
       "eth": 637214506.2907101,
       "ltc": 13390276238.687206,
     },
     "total_volume": {
       "btc": 1364555.6828879179,
       "eth": 20090375.143048584,
       "ltc": 422174433.01823574,
       "bch": 330959494.8270193
     },
     "market_cap_percentage": {
       "btc": 44.793601594309244,
       "eth": 18.869864025424487,
     },
     "market_cap_change_percentage_24h_usd": 2.722723135499246,
     "updated_at": 1685332502
   }
 }
 
 */

// MARK: - MarketDataModel
struct GlobalData : Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int?
    let markets: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int?

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap : String {
        
        if let marketCap = totalMarketCap.first(where: { (key, value) -> Bool in
            key == "usd"
        }){
            return "$\(marketCap.value.formattedWithAbbreviations())"
        }
        
        return ""
    }
    
    var volume : String {
        
        if let volume = totalVolume.first(where: { (key, value) -> Bool in
            key == "usd"
            
        }) {
            return "$\(volume.value.formattedWithAbbreviations())"
        }
        
        return ""
    }
    
    var btcDominant : String {
        
        if let btcPercentage = marketCapPercentage.first(where: { (key, value) -> Bool in
            key == "btc"
        }) {
            return "\(btcPercentage.value.asPercentString())"
        }
        
        return ""
    }
}
