//
//  ForEachSwitfUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct ForEachSwitfUI: View {
    
    let dataSet = ["A","B","C", "D","E"]
    var body: some View {
        HStack{
            VStack{
                ForEach(0..<10) { index in
                    Circle()
                        .fill(.green)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text("\(index + 1)")
                                .foregroundColor(.white)
                        )
                }
            }
                    
            VStack(spacing: 20){
                ForEach(dataSet.indices) {index in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.teal)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 4)
                        .overlay(
                            Text(dataSet[index])
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                    
                }
            }.padding(.leading, 32)
        }
        
        
    }
}

struct ForEachSwitfUI_Previews: PreviewProvider {
    static var previews: some View {
        ForEachSwitfUI()
    }
}
