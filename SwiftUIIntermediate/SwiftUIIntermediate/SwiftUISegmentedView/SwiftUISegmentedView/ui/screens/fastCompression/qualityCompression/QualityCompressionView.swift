//
//  QualityCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QualityCompressionView: View {
    
    @StateObject private var viewModel = QualityCompressViewModel()
    
    var body: some View {
        VStack{
            VStack{
                Toggle("Percentage", isOn: $viewModel.isPercentage)
                    .fontWeight(.semibold)
                    .padding(.bottom,10)
                    .tint(.primaryColor)
                
                if(viewModel.isPercentage){
                    CompressByPercentageItemView(title: "Frame Rate", sliderVlaue: $viewModel.frameRatePercentage)
                    CompressByPercentageItemView(title: "Bit Rate", sliderVlaue: $viewModel.bitRatePercentage)
                    CompressByPercentageItemView(title: "Resolution", sliderVlaue: $viewModel.resolutionRatePercentage)
                }
                
            }
            .padding()
            .background(getCardBackground())
            .padding(.horizontal,10)
            
            VStack{
                Toggle("Fixed Value", isOn: $viewModel.isFixedValue)
                    .fontWeight(.semibold)
                    .padding(.bottom,10)
                    .tint(.primaryColor)
                
                if(viewModel.isFixedValue){
                    CompressByFixedValueItemView(title: "Frame Rate", selectedValue: $viewModel.frameRateValue, selectedValueText: "Original")
                    CompressByFixedValueItemView(title: "Bit Rate", selectedValue: $viewModel.bitRateValue, selectedValueText: "Original")
                    CompressByFixedValueItemView(title: "Resolution", selectedValue: $viewModel.resolutionRateValue, selectedValueText: "Original")
                }
                
                
            }
            .padding()
            .background(getCardBackground())
            .padding(.horizontal,10)
        }
    }
}

struct QualityCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QualityCompressionView()
    }
}




