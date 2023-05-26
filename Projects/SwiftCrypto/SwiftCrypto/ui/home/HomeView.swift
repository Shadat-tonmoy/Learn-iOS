//
//  HomeView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var homeViewModel : HomeViewModel
    
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack{
            
            // background
            Color.theme.background
                .ignoresSafeArea()
            
            // content
            VStack{
                
                homeHeader
                
                HomeStatsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $homeViewModel.searchText)
                
                columnTitle
                
                if !showPortfolio {
                    allCoinList
                } else {
                    portfolioCoinList
                }
                
                
                Spacer(minLength: 0)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(developerPreview.homeViewModel)
    }
}

extension HomeView {
    
    var homeHeader : some View{
        HStack{
            
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircularButtonAnimationView(animate: $showPortfolio)
                )
                
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    var allCoinList : some View{
        List{
            ForEach(homeViewModel.allCoins, content: { coin in
                CoinRowView(coin: coin, showHoldings: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            })
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .leading))
    }
    
    var portfolioCoinList : some View{
        List{
            ForEach(homeViewModel.portfolioCoins, content: { coin in
                CoinRowView(coin: coin, showHoldings: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            })
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .trailing))
    }
    
    var columnTitle : some View{
        HStack{
            Text("Coin")
                
            
            Spacer()
            
            if showPortfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
}
