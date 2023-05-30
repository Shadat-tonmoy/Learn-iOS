//
//  PortfolioCoinLogoView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/30/23.
//

import SwiftUI

struct PortfolioCoinLogoView: View {
    
    let coin : CoinModel
    
    var body: some View {
        VStack{
            CoinImageView(coinModel: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(.theme.accent)
                .lineLimit(1)
                
            Text(coin.name)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .lineLimit(1)
        }
        .frame(width : 75)
        .padding(4)
    }
}

struct PortfolioCoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCoinLogoView(coin: developerPreview.coin)
    }
}
