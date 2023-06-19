//
//  DetailsViewScreen.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import SwiftUI

struct DetailsViewScreen: View {
    
    @StateObject private var viewModel : DetailsViewModel
    
    private var infoGrid : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    init(coin: CoinModel) {
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
        .navigationTitle((viewModel.coinModel.name))
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing, content: {
                toolbarTrailingIcon
            })
        }
    }
    
}

extension DetailsViewScreen {
    
    private var toolbarTrailingIcon : some View {
        HStack {
            Text(viewModel.coinModel.symbol.uppercased())
            CoinImageView(coinModel: viewModel.coinModel)
                .frame(width : 25, height: 25)
        }
    }
}

struct DetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailsViewScreen(coin: DeveloperPreview.instance.coin)
        }
    }
}
