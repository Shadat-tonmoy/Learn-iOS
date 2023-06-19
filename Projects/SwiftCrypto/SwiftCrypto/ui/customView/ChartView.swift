//
//  CartView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/19/23.
//

import SwiftUI

struct ChartView: View {
    
    private var data : [Double]
    let minY : Double
    let maxY : Double
    private var lineColor : Color
    let startingDate : Date
    let endingDate : Date
    @State private var percentage = 0.0
    
    init(coin : CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        minY = data.min() ?? 0
        maxY = data.max() ?? 0
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(alignment : .leading, content: {chartYAxis})
            
            chartDateLabel
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding()
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute : {
                withAnimation(.linear(duration: 2.0)) {
                    percentage = 1.0
                }
                
            })
        }
        
        
    }
}

extension ChartView {
    private var chartView : some View {
        
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
                
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2.0, lineCap: .round, lineJoin: .round))
            .shadow(color:lineColor,radius: 10, x: 0, y: 10)
            .shadow(color:lineColor.opacity(0.5),radius: 10, x: 0, y: 20)
            .shadow(color:lineColor.opacity(0.2),radius: 10, x: 0, y: 30)
            .shadow(color:lineColor.opacity(0.1),radius: 10, x: 0, y: 40)
        }
        
    }
    
    private var chartBackground : some View {
        VStack{
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis : some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            Text(((minY + maxY)/2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
    }
    
    private var chartDateLabel : some View {
        HStack{
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: developerPreview.coin)
            
    }
}
