//
//  FastCompressionTabView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct FastCompressionTabView: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        
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
    
    private func isSelected (position : Int) -> Bool {
        return position == viewModel.selectedTab
    }
}

struct FastCompressionTabView_Previews: PreviewProvider {
    static var previews: some View {
        FastCompressionTabView(viewModel: FastCompressionViewModel())
    }
}
