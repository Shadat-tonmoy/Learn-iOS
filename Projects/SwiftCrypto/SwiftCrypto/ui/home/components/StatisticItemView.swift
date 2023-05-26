//
//  StatisticItemView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/26/23.
//

import SwiftUI

struct StatisticItemView: View {
    
    let statisticModel : StatisticModel
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(statisticModel.title)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
            Text(statisticModel.value)
                .font(.headline)
                .foregroundColor(.theme.accent)
            HStack(spacing:4){
                
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: statisticModel.increasing() ? 0.0 : 180))
                    .foregroundColor(statisticModel.increasing() ? .theme.green : .theme.red)
                
                Text(statisticModel.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
                    .foregroundColor(statisticModel.increasing() ? .theme.green : .theme.red)
            }
            .opacity(statisticModel.percentageChange != nil ? 1.0 : 0.0)
            
        }
    }
}

struct StatisticItemView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticItemView(statisticModel: developerPreview.stat2)
    }
}
