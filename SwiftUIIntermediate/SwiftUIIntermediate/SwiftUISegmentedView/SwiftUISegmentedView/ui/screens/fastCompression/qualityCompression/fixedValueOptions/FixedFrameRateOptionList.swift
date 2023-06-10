//
//  FixedFrameRateOptionList.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import SwiftUI

struct FixedFrameRateOptionList: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(alignment : .leading){
            FixedOptionHeader(title: "Choose preferred frame rate",
                              subtitle: "Lower the frame rate, lower the size", clickCallback: {
                
                viewModel.showFixedFrameRateOption.toggle()
                
            })
            
            List(viewModel.getFixedValueFrameRateOptionList(), rowContent: { option in
                VideoPropertyOptionView(title: option.title, isSelected: option.isSelected)
                
                
            })
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        .presentationDetents([.fraction(0.75)])
    }
}

struct FixedFrameRateOptionList_Previews: PreviewProvider {
    static var previews: some View {
        FixedFrameRateOptionList(viewModel: FastCompressionViewModel())
    }
}
