//
//  ResolutionCompressionOptionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/18/23.
//

import SwiftUI

struct ResolutionCompressionOptionView: View {
    var body: some View {
        VStack(alignment : .leading, spacing:20){
            ForEach(ResolutionOptionRepo.getOptions(), id: \.self){ option in
                ResolutionCompressionOptionItemView(title: option.title, subtitle: option.subtitle)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        .padding(.horizontal,10)
        .background(getCardBackground())
        .padding(.horizontal, 10)
    }
}

struct ResolutionCompressionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResolutionCompressionOptionView()
    }
}

struct ResolutionCompressionOptionItemView: View {
    let title : String
    let subtitle : String
    
    var body: some View {
        VStack(alignment:.leading)
        {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.caption)
        }
    }
}
