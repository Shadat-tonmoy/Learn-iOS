//
//  DetailsViewScreen.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import SwiftUI

struct DetailsViewScreen: View {
    
    let coin : CoinModel
    
    @StateObject private var viewModel : DetailsViewModel = DetailsViewModel()
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initialized with : \(coin.name)")
//        viewModel.fetchCoinDetails(coinId: coin.id)

    }
    
    var body: some View {
        VStack {
            Text(coin.name)
        }
        .onAppear{
            viewModel.fetchCoinDetails(coinId: coin.id)
        }
    }
    
}

struct DetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViewScreen(coin: DeveloperPreview.instance.coin)
    }
}
