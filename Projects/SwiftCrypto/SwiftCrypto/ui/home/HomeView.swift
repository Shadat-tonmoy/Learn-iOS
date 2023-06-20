//
//  HomeView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var homeViewModel : HomeViewModel
    @EnvironmentObject private var navigationPaths : NavigationPaths
    
    @State private var showPortfolio = false
    
    @State private var showManagePortfolio = false
    
    @State private var showSettingMenu = false
    
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
        .sheet(isPresented: $showManagePortfolio, content: {
            PortfolioView(showManagePortfolioView: $showManagePortfolio)
                .environmentObject(homeViewModel)
        })
        .sheet(isPresented: $showSettingMenu, content: {
            SettingsView(showSettings: $showSettingMenu)
        })
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
                .onTapGesture {
                    if showPortfolio {
                        showManagePortfolio.toggle()
                    } else {
                        showSettingMenu.toggle()
                        
                    }
                }
            
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
            ForEach(homeViewModel.allCoins.indices, id: \.self,  content: { coinIndex in
                let coin = homeViewModel.allCoins[coinIndex]
                CoinRowView(coin: coin, showHoldings: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        navigationPaths.addCoinDetailsScreen(index: coinIndex)
                    }
            })
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .leading))
        .navigationDestination(for: Int.self, destination: { index in
            let coinAtIndex = homeViewModel.allCoins[index]
            DetailsViewScreen(coin: coinAtIndex)
        })
    }
    
    
    var portfolioCoinList : some View{
        List{
            ForEach(homeViewModel.portfolioCoins, content: { coin in
                CoinRowView(coin: coin, showHoldings: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            })
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .trailing))
    }
    
    var columnTitle : some View{
        HStack{
            
            
            HStack(spacing:4) {
                Text("Coin")
                if homeViewModel.sortedByRank() {
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: homeViewModel.getRankIconRotation()))
                }
            }
            .onTapGesture {
                withAnimation(.default) {
                    homeViewModel.updateRankSortOption()
                }
            }
            
            
            Spacer()
            
            if showPortfolio {
                
                HStack(spacing:4) {
                    Text("Holdings")
                    if homeViewModel.sortedByHoldings() {
                        Image(systemName: "chevron.down")
                            .rotationEffect(Angle(degrees: homeViewModel.getHoldingsIconRotation()))
                    }
                }
                .onTapGesture {
                    withAnimation(.default) {
                        homeViewModel.updateHoldingsSortOption()
                    }
                }
                
            }
            
            HStack(spacing:4) {
                
                Text("Price")
                if homeViewModel.sortedByPrice() {
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: homeViewModel.getPriceIconRotation()))
                }
                
            }
            .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    homeViewModel.updatePriceSortOption()
                }
            }
            
            Button(action: {
                withAnimation(.linear(duration: 2)) {
                    
                }
                
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: homeViewModel.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
}
