//
//  FormatOptionScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct FormatOptionScreen: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(alignment : .leading) {
            VideoPropertyOptionHeaderView(title: "Choose Preferred Format", clickCallback: {
                viewModel.hideFormatOptions()
            })
            
            List(viewModel.getFormatOptions(), rowContent: { option in
                VideoPropertyOptionView(title: option.title, isSelected: option.isSelected)
                    .onTapGesture {
                        viewModel.updateSelectedFormat(selectedOption: option)
                    }
                
            })
            .listStyle(PlainListStyle())
            
        }
        .presentationDetents([.fraction(0.95)])
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,5)
    }
}

struct FormatOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormatOptionScreen(viewModel: FastCompressionViewModel())
    }
}




