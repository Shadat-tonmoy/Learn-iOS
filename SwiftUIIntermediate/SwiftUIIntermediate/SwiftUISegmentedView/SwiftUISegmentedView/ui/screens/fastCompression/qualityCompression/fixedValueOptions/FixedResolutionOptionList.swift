//
//  FixedResolutionOptionList.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import SwiftUI

struct FixedResolutionOptionList: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(alignment : .leading){
            
            FixedOptionHeader(title: "Choose preferred resolution",
                              subtitle: "Lower the resolution, lower the size", clickCallback: {
                
                viewModel.showFixedResolutionOption.toggle()
                
            })
            
            List(viewModel.getFixedValueResolutionOptionList(), rowContent: { option in
                VideoPropertyOptionView(title: option.title, isSelected: option.isSelected)
                
                
            })
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        .presentationDetents([.fraction(0.75)])
    }
}

struct FixedResolutionOptionList_Previews: PreviewProvider {
    static var previews: some View {
        FixedResolutionOptionList(viewModel: FastCompressionViewModel())
    }
}
