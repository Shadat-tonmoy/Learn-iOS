//
//  HomeStatsView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/26/23.
//

import SwiftUI

struct HomeStatsView: View {
    
    @Binding var showPortfolio : Bool
    @EnvironmentObject var homeViewModel : HomeViewModel
    
    var body: some View {
        HStack{
            ForEach(homeViewModel.statModelList, content: { statModel in
                StatisticItemView(statisticModel: statModel)
                    .frame(width: UIScreen.main.bounds.width / 3)
            })
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio : .constant(false))
            .environmentObject(developerPreview.homeViewModel)
    }
}
