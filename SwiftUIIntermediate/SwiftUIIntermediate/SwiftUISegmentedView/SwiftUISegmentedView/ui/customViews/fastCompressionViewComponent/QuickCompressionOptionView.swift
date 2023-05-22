//
//  FastCompressionOptionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import SwiftUI

struct QuickCompressionOptionView: View {
    var body: some View {
        VStack(spacing:10) {
            VStack(alignment : .leading, spacing:10){
                ForEach(QuickCompressionOptionRepo.getOptions(), content: { option in
                    QuickCompressionOptionItemView(option: option)
                })
                
            }
            .background(getCardBackground())
            .padding(.horizontal,10)
            
//            VStack(alignment : .leading, spacing:20){
//                QuickCompressionOptionItemView(option : QuickCompressOption(title: "Fit To File Size", subtitle: "Slower Compression"))
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.vertical)
//            .padding(.horizontal,10)
//            .background(getCardBackground())
//            .padding(.horizontal, 10)
        }
        
    }
}

struct QuickCompressionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionOptionView()
    }
}

struct QuickCompressionOptionItemView: View {
    
    let option : QuickCompressOption
    
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
        
    }
}
