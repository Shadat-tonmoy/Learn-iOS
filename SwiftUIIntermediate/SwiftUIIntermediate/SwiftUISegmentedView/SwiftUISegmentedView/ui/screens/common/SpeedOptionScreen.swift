//
//  SpeedOptionScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct SpeedOptionScreen: View {
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        
        VStack(alignment : .leading) {
            
            VideoPropertyOptionHeaderView(title: "Choose Preferred Speed", clickCallback: {
                viewModel.hideSpeedOptions()
            })
            
            List(ProcessingSpeedOptionRepo.getOptions(), rowContent: { option in
                VideoPropertyOptionView(title: option.title, isSelected: option.isSelected)
                    .onTapGesture {
                        viewModel.updateSelectedProcessingSpeedOption(selectedOption: option)
                    }
                
            })
            .listStyle(PlainListStyle())
            
        }
        .presentationDetents([.fraction(0.25)])
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,5)
    }
}

struct SpeedOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpeedOptionScreen(viewModel: FastCompressionViewModel())
    }
}
