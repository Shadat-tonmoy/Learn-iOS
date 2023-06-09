//
//  DetailsViewScreen.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import SwiftUI

struct DetailsViewScreen: View {
    
    let coin : CoinModel
    
//    @StateObject private var viewModel : DetailsViewModel = DetailsViewModel()
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initialized with : \(coin.name)")

    }
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViewScreen(coin: DeveloperPreview.instance.coin)
    }
}
