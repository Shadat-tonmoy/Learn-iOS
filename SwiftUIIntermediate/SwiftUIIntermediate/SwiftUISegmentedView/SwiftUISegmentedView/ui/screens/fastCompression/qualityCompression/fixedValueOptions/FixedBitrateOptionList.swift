//
//  FixedBitrateOptionList.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/10/23.
//

import SwiftUI

struct FixedBitrateOptionList: View {
    
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(alignment : .leading){
            FixedOptionHeader(title: "Choose preferred bit rate",
                              subtitle: "Lower the bit rate, lower the size", clickCallback: {
                viewModel.showFixedBitRateOption.toggle()
                
            })
            
            List(viewModel.getFixedValueBitRateOptionList(), rowContent: { option in
                FixedBitRateOptionItemView(option: option)
                
                
            })
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        .presentationDetents([.fraction(0.45)])
    }
}

struct FixedBitrateOptionList_Previews: PreviewProvider {
    static var previews: some View {
        FixedBitrateOptionList(viewModel : FastCompressionViewModel())
    }
}

struct FixedBitRateOptionItemView: View {
    
    let option : BitRateOption
    
    var body: some View {
        HStack {
            Text(option.title)
            Spacer()
            Text(option.range)
        }
        .font(.system(size: 16))
        .fontWeight(.medium)
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .frame(maxWidth : .infinity, alignment: .leading)
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
