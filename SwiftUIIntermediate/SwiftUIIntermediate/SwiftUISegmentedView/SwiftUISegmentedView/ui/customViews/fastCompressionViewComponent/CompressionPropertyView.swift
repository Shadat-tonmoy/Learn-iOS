//
//  CompressionPropertyView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import SwiftUI

struct CompressionPropertyView: View {
    
    var optionCallback : (_ optionId : Int) -> Void
    
    var body: some View {
        HStack(spacing:24){
            PropertyItemView(title: "Codec", value: "h264")
                .onTapGesture {
                    optionCallback(1)
                }
            Spacer()
            PropertyItemView(title: "Format", value: "MP4")
                .onTapGesture {
                    optionCallback(1)
                }
            Spacer()
            PropertyItemView(title: "Speed", value: "Normal")
                .onTapGesture {
                    optionCallback(1)
                }
        }
        .padding(10)
        .background(getCardBackground())
        .padding(10)
    }
}

struct CompressionPropertyView_Previews: PreviewProvider {
    static var previews: some View {
        CompressionPropertyView(optionCallback: {id in })
    }
}

struct PropertyItemView: View {
    let title : String
    let value : String
    
    var body: some View {
        VStack(alignment : .leading, spacing: 4){
            Text(title)
                .font(.caption)
            
            HStack{
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 8, height: 8)
                    
            }
            
            
        }
    }
}
