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
            HStack(){
                ForEach(0..<viewModel.tabs.count, id: \.self, content: { index in
                    Text(viewModel.tabs[index])
                        .frame(maxWidth: .infinity)
                        .foregroundColor(getForegroundColor(index))
                        .padding(.vertical, 12)
                        .overlay(getBackgroundColor(index), alignment: .bottom)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)){
                                viewModel.selectedTab = index
                            }
                            
                            
                        }
                    
                })
            }
            .background(Color.toolbarBG)
            
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
            FormatOptionScreen()
        })
        .sheet(isPresented: $viewModel.showCodecOptions, content: {
            CodecOptionScreen()
        })
        .sheet(isPresented: $viewModel.showSpeedOptions, content: {
            SpeedOptionScreen()
        })
        .sheet(isPresented: $viewModel.showAdjustVolumeOption, content: {
            AdjustVolumeScreen()
        })
        
    }
    
    private func isSelected (position : Int) -> Bool {
        return position == viewModel.selectedTab
    }
    
    private func getForegroundColor(_ position : Int) -> Color {
        return isSelected(position: position) ? .white : .white
    }
    
    private func getBackgroundColor(_ position : Int) -> AnyView {
        return isSelected(position: position) ? AnyView(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(height: 4)
            
        ) : AnyView(EmptyView())
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
