//
//  QuickCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QuickCompressionView: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack{
            
            QuickCompressionOptionView(viewModel: viewModel)
            
            FitToShareWithView()
            
        }
    }
}

struct QuickCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionView(viewModel: FastCompressionViewModel())
    }
}

struct QuickCompressionOptionView: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(spacing:10) {
            VStack(alignment : .leading, spacing:10){
                ForEach(viewModel.getQuickCompressionOptions(), content: { option in
                    QuickCompressionOptionItemView(option: option, optionClickListener: onOptionClicked)
                })
                
            }
            .background(getCardBackground())
            .padding(.horizontal,10)
        }
        
    }
    
    func onOptionClicked(option : QuickCompressOption) -> Void {
        print("onOptionClicked : \(option.title)")
        viewModel.updateQuickCompressionSelectedOption(selectedOption: option)
    }
}

struct QuickCompressionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionOptionView(viewModel: FastCompressionViewModel())
    }
}

struct QuickCompressionOptionItemView: View {
    
    var option : QuickCompressOption
    var optionClickListener : (_ option : QuickCompressOption) -> Void
    
    var body: some View {
    
        VStack(alignment:.leading) {
            Text(option.title)
                .font(.headline)
            Text(option.description)
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
