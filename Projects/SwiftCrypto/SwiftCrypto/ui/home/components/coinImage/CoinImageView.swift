//
//  CoinImageView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/25/23.
//

import SwiftUI

struct CoinImageView: View {
    
//    let coinModel : CoinModel
    
    @StateObject private var viewModel : CoinImageViewModel
    
    init(coinModel : CoinModel){
//        self.coinModel = coinModel
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coinModel))
    }
    
    var body: some View {
        ZStack{
            if let uiImage = viewModel.coinImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Image(systemName: "questionmark")
                }
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coinModel: DeveloperPreview.instance.coin)
    }
}
