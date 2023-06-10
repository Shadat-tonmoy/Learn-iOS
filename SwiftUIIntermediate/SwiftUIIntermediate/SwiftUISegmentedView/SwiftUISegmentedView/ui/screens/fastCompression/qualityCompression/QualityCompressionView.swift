//
//  QualityCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QualityCompressionView: View {
    
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Text("Percentage")
                    Toggle("", isOn: $viewModel.isPercentage)
                        .tint(.primaryColor)
                }
                .fontWeight(.semibold)
                
                if(viewModel.isPercentage) {
                    CompressByPercentageItemView(title: "Frame Rate", sliderVlaue: $viewModel.frameRatePercentage)
                        
                    CompressByPercentageItemView(title: "Bit Rate", sliderVlaue: $viewModel.bitRatePercentage)
                
                    CompressByPercentageItemView(title: "Resolution", sliderVlaue: $viewModel.resolutionRatePercentage)
                }
                
            }
            .padding()
            .background(getCardBackground())
            .padding(.horizontal,10)
            .onTapGesture {
                viewModel.enablePercentageOption()
            }
            
            
            VStack{
                HStack{
                    Text("Fixed Value")
                    Toggle("", isOn: $viewModel.isFixedValue)
                        .tint(.primaryColor)
                }
                .fontWeight(.semibold)
                
                if(viewModel.isFixedValue){
                    CompressByFixedValueItemView(title: "Frame Rate", selectedValue: $viewModel.frameRateValue, selectedValueText: "Original")
                        .onTapGesture {
                            viewModel.showFixedFrameRateOption.toggle()
                            
                        }
                    
                    CompressByFixedValueItemView(title: "Bit Rate", selectedValue: $viewModel.bitRateValue, selectedValueText: "Original")
                        .onTapGesture {
                            viewModel.showFixedBitRateOption.toggle()
                        }
                    
                    CompressByFixedValueItemView(title: "Resolution", selectedValue: $viewModel.resolutionRateValue, selectedValueText: "Original")
                        .onTapGesture {
                            viewModel.showFixedResolutionOption.toggle()
                        }
                }
            }
            .padding()
            .background(getCardBackground())
            .padding(.horizontal,10)
            .onTapGesture {
                viewModel.enableFixedValueOption()
            }
        }
        .sheet(isPresented: $viewModel.showFixedFrameRateOption, content: {
            FixedFrameRateOptionList(viewModel: viewModel)
            
        })
        .sheet(isPresented: $viewModel.showFixedBitRateOption, content: {
            FixedBitrateOptionList(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.showFixedResolutionOption, content: {
            FixedResolutionOptionList(viewModel: viewModel)
        })
    }
}

struct QualityCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QualityCompressionView(viewModel: FastCompressionViewModel())
    }
}




