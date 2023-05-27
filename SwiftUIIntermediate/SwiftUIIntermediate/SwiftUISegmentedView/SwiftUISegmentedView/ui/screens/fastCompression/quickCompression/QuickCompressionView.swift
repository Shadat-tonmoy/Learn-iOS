//
//  QuickCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QuickCompressionView: View {
    
    @StateObject var optionRepo : QuickCompressionOptionRepo
    
    var body: some View {
        VStack{
            
            QuickCompressionOptionView(optionRepo: optionRepo)
            
            FitToShareWithView()
            
        }
    }
}

struct QuickCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionView(optionRepo: (QuickCompressionOptionRepo()))
    }
}

struct QuickCompressionOptionView: View {
    
    @StateObject var optionRepo : QuickCompressionOptionRepo
    
    var body: some View {
        VStack(spacing:10) {
            VStack(alignment : .leading, spacing:10){
                ForEach($optionRepo.options, content: { option in
                    QuickCompressionOptionItemView(option: option, optionClickListener: onOptionClicked)
                })
                
            }
            .background(getCardBackground())
            .padding(.horizontal,10)
        }
        
    }
    
    func onOptionClicked(option : QuickCompressOption) -> Void {
        print("onOptionClicked : \(option.title)")
        optionRepo.updateSelectedOption(selectedOption: option)
    }
}

struct QuickCompressionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionOptionView(optionRepo: (QuickCompressionOptionRepo()))
    }
}

struct QuickCompressionOptionItemView: View {
    
    @Binding var option : QuickCompressOption
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
