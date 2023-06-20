//
//  DetailsViewScreen.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import SwiftUI

struct DetailsViewScreen: View {
    
    @StateObject private var viewModel : DetailsViewModel
    @State private var showFullDescription = false
    
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
                ChartView(coin: viewModel.coinModel)
                VStack {
                    overviewSection
                    
                    additionalInfoSection
                    
                    linkSection
                    
                    
                }
                .padding()
            }
            .padding(.vertical)
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
    
    private var overviewSection : some View {
        VStack{
            Text("Overview")
                .font(.title)
                .bold()
                .foregroundColor(.theme.accent)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            if let description = viewModel.description {
                if !description.isEmpty {
                    VStack (alignment : .leading){
                        Text(description.removingHTMLOccurances)
                            .lineLimit(showFullDescription ? nil : 3)
                            .font(.callout)
                            .foregroundColor(Color.theme.secondaryText)
                        
                        let readMoreLabel = showFullDescription ? "Less" : "Read More..."
                        
                        Text(readMoreLabel)
                            .font(.callout)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.vertical, 4)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showFullDescription.toggle()
                                }
                            }
                    }
                }
            }
            
            LazyVGrid(columns: infoGrid, alignment: .leading, content: {
                ForEach(viewModel.overviewStats, content: { stat in
                    StatisticItemView(statisticModel: stat)
                })
            })
        }
    }
    
    private var additionalInfoSection : some View {
        VStack {
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
    }
    
    private var linkSection : some View {
        VStack(alignment : .leading, spacing : 20) {
            if let websiteString = viewModel.websiteUrl,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            if let redditString = viewModel.redditUrl,
               let redditUrl = URL(string: redditString) {
                Link("Reddit", destination: redditUrl)
            }
        }
        .padding(.vertical)
        .foregroundColor(.blue)
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailsViewScreen(coin: DeveloperPreview.instance.coin)
        }
    }
}
