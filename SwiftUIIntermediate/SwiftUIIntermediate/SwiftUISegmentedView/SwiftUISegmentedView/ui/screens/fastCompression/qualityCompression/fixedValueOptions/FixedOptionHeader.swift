//
//  FixedOptionHeader.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import SwiftUI

struct FixedOptionHeader: View {
    let title : String
    let subtitle : String
    let clickCallback : () -> Void
    
    var body: some View {
        VStack(alignment : .leading){
            HStack {
                Image(systemName: "chevron.left")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .onTapGesture {
                        clickCallback()
                    }
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
            }
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,18)
        .padding(.vertical,10)
    }
}

struct FixedOptionHeader_Previews: PreviewProvider {
    static var previews: some View {
        FixedOptionHeader(title: "Choose preferred frame rate", subtitle: "Lower the frame rate, lower the size", clickCallback: {
            
        })
    }
}
