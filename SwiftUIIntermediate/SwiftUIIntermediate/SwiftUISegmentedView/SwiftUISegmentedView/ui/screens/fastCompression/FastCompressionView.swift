//
//  FastCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct FastCompressionView: View {
    
    
    
    @State private var selectedTab = 1
    
    private var tabs : [String] = ["Quick", "Resolution", "Quality", ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            NavbarWithBackButton(title: "Fast Compression")
            HStack(){
                ForEach(0..<tabs.count, id: \.self, content: { index in
                    Text(tabs[index])
                        .frame(maxWidth: .infinity)
                        .foregroundColor(getForegroundColor(index))
                        .padding(.vertical, 12)
                        .overlay(getBackgroundColor(index), alignment: .bottom)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)){
                                selectedTab = index
                            }
                            
                            
                        }
                    
                })
            }
            .background(Color.toolbarBG)
            
            CompressionPropertyView()
            
            getSelectedTabView()
                .transition(.move(edge: .trailing))
            
            TrimVideoButtonView()
            
            AdjustVolumeButtonView()
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        
        
        
        
        
        
        
    }
    
    private func isSelected (position : Int) -> Bool {
        return position == selectedTab
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
        if(selectedTab == Constans.quickCompression) {
            return AnyView(QuickCompressionView())
        } else if(selectedTab == Constans.resolutionCompression) {
            return AnyView(ResolutionCompressionView())
        } else if(selectedTab == Constans.qualityCompression){
            return AnyView(QualityCompressionView())
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct FastCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        FastCompressionView()
    }
}
