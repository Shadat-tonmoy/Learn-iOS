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
    
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    SearchBarView(searchText: $homeViewModel.searchText)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(homeViewModel.allCoins, content: { coin in
                                PortfolioCoinLogoView(coin: coin)
                            })
                        }
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
            })
        }
        
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
}
