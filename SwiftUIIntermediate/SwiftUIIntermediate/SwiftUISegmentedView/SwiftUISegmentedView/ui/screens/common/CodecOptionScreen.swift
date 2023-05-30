//
//  CodecOptionScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct CodecOptionScreen: View {
    
    @State private var sheetHeight: CGFloat = .zero
    @StateObject var viewModel : FastCompressionViewModel
    
    
    
    var body: some View {
        VStack(alignment : .leading) {
            
            VideoPropertyOptionHeaderView(title: "Choose Preferred Codec", clickCallback: {
                viewModel.hideCodecOptions()
            })
            
            List(viewModel.getCodecOptions(), rowContent: { option in
                
                VideoPropertyOptionView(title: option.title, isSelected: option.isSelected)
                .onTapGesture {
                    viewModel.updateSelectedCodecOption(selectedOption: option)
                }
                
            })
            .listStyle(PlainListStyle())
            
        }
        .presentationDetents([.fraction(0.25)])
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,5)
    }
}

struct CodecOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        CodecOptionScreen(viewModel: FastCompressionViewModel())
    }
}
