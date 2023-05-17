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
            VStack(alignment : .leading, spacing:20){
                QuickCompressionOptionItemView(title: "Small File", subtitle: "Acceptable Quality & Resolution (30% of Original Resolution")
                
                QuickCompressionOptionItemView(title: "Medium File", subtitle: "Good Quality & Resolution (50% of Original Resolution")
                
                QuickCompressionOptionItemView(title: "Large File", subtitle: "Best Quality & Resolution (75% of Original Resolution")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(getCardBackground())
            .padding(.horizontal, 10)
            
            VStack(alignment : .leading, spacing:20){
                QuickCompressionOptionItemView(title: "Fit To File Size", subtitle: "Slower Compression")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(getCardBackground())
            .padding(.horizontal, 10)
        }
        
    }
}

struct QuickCompressionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionOptionView()
    }
}

struct QuickCompressionOptionItemView: View {
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
