//
//  ResolutionCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct ResolutionCompressionView: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(alignment : .leading, spacing:10){
            ForEach(viewModel.getResolutionCompressionOptions(), id: \.self.id){ option in
                ResolutionCompressionOptionItemView(option: option, optionClickListener: onOptionClicked)
            }
        }
        .background(getCardBackground())
        .padding(.horizontal,10)
    }
    
    func onOptionClicked(option : ResolutionCompressionOption) -> Void {
        print("onOptionClicked : \(option.title)")
        viewModel.updateResolutionCompressionSelectedOption(selectedOption: option)
    }
}

struct ResolutionCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        ResolutionCompressionView(viewModel: FastCompressionViewModel())
    }
}

struct ResolutionCompressionOptionItemView: View {
    
    let option : ResolutionCompressionOption
    let optionClickListener : (_ selectedOption : ResolutionCompressionOption) -> Void
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(option.title)
                .font(.headline)
            Text(option.subtitle)
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .overlay{
            if(option.isSelected){
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.primaryColor.opacity(0.15))
                    
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.primaryColor)
                }
            }
        }
        .onTapGesture {
            optionClickListener(option)
        }
    }
}
