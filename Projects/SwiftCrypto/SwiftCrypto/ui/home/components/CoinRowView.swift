//
//  CoinRowView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/23/23.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    let showHoldings : Bool
    
    var body: some View {
        HStack(spacing : 0){
            
            leftColumn
            
            Spacer()
            
            if showHoldings {
                centerColumn
            }
            
            rightColumn
            
            
            
            
            
        }
    }
}


extension CoinRowView {
    var leftColumn : some View {
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(width:30)
            
            CoinImageView(coinModel: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(.theme.accent)
                .padding(.leading, 6)
        }
    }
    
    var rightColumn : some View{
        VStack(alignment : .trailing){
            Text("\(coin.currentPrice.asCurrencyWithDecimal())")
                .fontWeight(.bold)
                .foregroundColor(.theme.accent)
            
            
            Text(coin.priceChangePercentage24HInCurrency?.asPercentString() ?? "0.0")
                .foregroundColor(
                    coin.negativePriceChange ? .theme.red : .theme.green
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
    }
    
    var centerColumn : some View{
        VStack(alignment : .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWithDecimal())
                .bold()
            
            Text(coin.currentHoldings?.asNumberString() ?? "")
        }
    }
    
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: developerPreview.coin, showHoldings: true)
            CoinRowView(coin: developerPreview.coin, showHoldings: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
