//
//  FastCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct FastCompressionView: View {
    
    
    @StateObject private var viewModel : FastCompressionViewModel = FastCompressionViewModel()
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            NavbarWithBackButton(title: "Fast Compression")
            
            FastCompressionTabView(viewModel: viewModel)
                      
            CompressionPropertyView(optionCallback: propertyOptionCallback)
            
            getSelectedTabView()
                .transition(.move(edge: .trailing))
            
            TrimVideoButtonView()
            
            AdjustVolumeButtonView()
                .onTapGesture {
                    viewModel.showAdjustVolumeOption = true
                }
            
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $viewModel.showFormatOptions, content: {
            FormatOptionScreen(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.showCodecOptions, content: {
            CodecOptionScreen(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.showSpeedOptions, content: {
            SpeedOptionScreen(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.showAdjustVolumeOption, content: {
            AdjustVolumeScreen(showSheet: $viewModel.showAdjustVolumeOption,viewModel: viewModel)
        })
        
    }
    
    private func getSelectedTabView() -> AnyView {
        return viewModel.getSelectedTabView()
    }
    
    private func propertyOptionCallback(optionId : Int){
        viewModel.updateVideoPropertyOption(value: optionId)
    }
}

struct FastCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        FastCompressionView()
    }
}
