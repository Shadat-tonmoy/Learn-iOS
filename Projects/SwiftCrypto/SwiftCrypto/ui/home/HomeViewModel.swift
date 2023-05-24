//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        })
    }
}
