//
//  PortfolioView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/30/23.
//

import SwiftUI

struct PortfolioView: View {
    
    @Binding var showManagePortfolioView : Bool
    
    @EnvironmentObject private var homeViewModel : HomeViewModel
    
    @State var selectedCoin : CoinModel?
    
    @State var quantityText : String = ""
    
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    SearchBarView(searchText: $homeViewModel.searchText)
                    
                    coinListView
                    
                    if selectedCoin != nil {
                        selectedCoinInfoView
                    }
                    
                    
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    closeButton
                        .onTapGesture {
                            showManagePortfolioView.toggle()
                        }
                })
                
                ToolbarItem(placement : .navigationBarTrailing , content: {
                    Text("Save".uppercased())
                        .onTapGesture {
                            saveButtonPressed()
                            
                        }
                })
            })
            .onChange(of: homeViewModel.searchText, perform: { text in
                if text.isEmpty {
                    removeSelectedCoin()
                }
                
            })
        }
        
    }
    
    private func saveButtonPressed(){
        UIApplication.shared.endEditing()
        guard
            let coinToUpdate = selectedCoin,
            let amount = Double(quantityText) else {
            return
        }
        
        homeViewModel.updatePortfolio(coinModel: coinToUpdate, amount: amount)
        showManagePortfolioView.toggle()
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(showManagePortfolioView: .constant(false))
            .environmentObject(developerPreview.homeViewModel)
        
    }
}

extension PortfolioView {
    
    private var closeButton : some View{
        
        Image(systemName: "xmark")
            .font(.headline)
    }
    
    private var coinListView : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(homeViewModel.searchText.isEmpty ? homeViewModel.portfolioCoins : homeViewModel.allCoins, content: { coin in
                    PortfolioCoinLogoView(coin: coin)
                        .onTapGesture {
                            updateSelectedCoin(coin: coin)
                        }
                        .overlay{
                            if coin.id == selectedCoin?.id {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            }
                        }
                })
            }
            .padding(.leading)
        }
    }
    
    private var selectedCoinInfoView : some View {
        VStack(spacing:20) {
            HStack{
                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? "")")
                
                Spacer()
                
                Text(selectedCoin?.currentPrice.asCurrencyWithDecimal() ?? "")
            }
            
            Divider()
            
            HStack{
                Text("Amount holding :")
                
                Spacer()
                
                TextField("Ex : 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack{
                Text("Current Value :")
                Spacer()
                Text(getCurrentValueAsString())
            }
            
        }
        .font(.headline)
        .padding()
    }
    
    private func getCurrentValueAsString() -> String {
        if let quantity = Double(quantityText) {
            return (quantity * (selectedCoin?.currentPrice ?? 0.0)).asCurrencyWithDecimal()
        }
        return (0.0).asCurrencyWithDecimal()
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
    }
    
    private func updateSelectedCoin(coin : CoinModel) {
        
        selectedCoin = coin
        
        print("UpdateSelectedCoin : \(selectedCoin)")
        
        if let portfolioCoin = homeViewModel.portfolioCoins.first(where: { coinModel in
            coinModel.id == coin.id
        }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
            print("UpdateSelectedCoin : amount : \(amount)")
        } else {
            print("UpdateSelectedCoin : is null")
            quantityText = ""
        }
    }
}
