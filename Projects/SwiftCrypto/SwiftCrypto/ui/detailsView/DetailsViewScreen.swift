//
//  DetailsViewScreen.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import SwiftUI

struct DetailsViewScreen: View {
    
//    let coin : CoinModel
    
    @StateObject private var viewModel : DetailsViewModel
    
    private var infoGrid : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    init(coin: CoinModel) {
//        self.coin = coin
        _viewModel = StateObject(wrappedValue: DetailsViewModel(coinModel: coin))
        print("Initialized with : \(coin.name)")
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("")
                    .frame(height : 150)
                
                Text("Overview")
                    .font(.title)
                    .bold()
                    .foregroundColor(.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                LazyVGrid(columns: infoGrid, alignment: .leading, content: {
                    ForEach(viewModel.overviewStats, content: { stat in
                        StatisticItemView(statisticModel: stat)
                    })
                })
                
                
                Text("Additional Info")
                    .font(.title)
                    .bold()
                    .foregroundColor(.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                LazyVGrid(columns: infoGrid, alignment: .leading, content: {
                    ForEach(viewModel.additionalStats, content: { stat in
                        StatisticItemView(statisticModel: stat)
                        
                    })
                })
                
                
            }
            .padding()
        }
//        .onAppear{
//            viewModel.fetchCoinDetails(coinId: coin.id)
//        }
        .navigationTitle((viewModel.coinModel?.name) ?? "")
    }
    
}

struct DetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailsViewScreen(coin: DeveloperPreview.instance.coin)
        }
    }
}
