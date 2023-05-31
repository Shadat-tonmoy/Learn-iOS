//
//  VideoPropertyOptionHeaderView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/30/23.
//

import SwiftUI

struct VideoPropertyOptionHeaderView : View {
    
    
    var title : String
    var clickCallback : () -> Void
    
    var body: some View {
        HStack{
            
            HStack{
                Image(systemName: "chevron.left")
            }.onTapGesture {
                clickCallback()
            }
            
            Text(title)
                .padding(.leading,8)
            
            Spacer()
            
        }
        .padding(.top,15)
        .font(.headline)
        .padding(.horizontal)
    }
}
struct VideoPropertyOptionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
//        VideoPropertyOptionView(title: "MP4", isSelected: true)
        VideoPropertyOptionHeaderView(title: "Adjust Volume", clickCallback: {})
    }
}

struct VideoPropertyOptionView: View {
    
    let title : String
    let isSelected : Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 14))
            .fontWeight(.medium)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .frame(maxWidth : .infinity, alignment: .leading)
            .overlay{
                if(isSelected){
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
