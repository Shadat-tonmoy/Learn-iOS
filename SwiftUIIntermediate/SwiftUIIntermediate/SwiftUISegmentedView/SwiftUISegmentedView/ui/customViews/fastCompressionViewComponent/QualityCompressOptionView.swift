//
//  QualityCompressOptionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/20/23.
//

import SwiftUI

struct CompressByPercentageItemView: View {
    
    var title : String
    @Binding var sliderVlaue : Double
    
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 14))
                .frame(width: 100, alignment: .leading)
            
            Slider(value: $sliderVlaue, in: 1...100, step: 1.0)
                .tint(Color.primaryColor)
            
            Spacer()
            Text("\(Int(sliderVlaue))%")
                .font(.system(size: 14))
                .frame(width: 50, alignment: .trailing)
            
        }
        .padding(.vertical, 10)
    }
}

struct CompressByFixedValueItemView: View {
    
    var title : String
    @Binding var selectedValue : Double
    var selectedValueText : String
    
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 15))
                .frame(width: 120, alignment: .leading)
            
            Text(selectedValueText)
                .font(.system(size: 15))
            
            Spacer()
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 8, height: 8)
            
        }
        .padding(.vertical, 10)
    }
}


struct CompressByPercentageItemView_Previews: PreviewProvider {
    @State static var sliderValue = 100.0
    static var previews: some View {
        CompressByFixedValueItemView(title: "Frame Rate", selectedValue: $sliderValue, selectedValueText: "24 FPS")
    }
}
