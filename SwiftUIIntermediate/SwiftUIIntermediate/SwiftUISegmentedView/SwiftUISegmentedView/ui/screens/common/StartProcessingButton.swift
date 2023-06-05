//
//  StartProcessingButton.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/5/23.
//

import SwiftUI

struct StartProcessingButton: View {
    let title : String
    var body: some View {
        HStack {
            Text(title)
            Image(systemName: "arrow.forward")
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .padding(.horizontal,5)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.primaryColor)
            
        )
    }
}

struct StartProcessingButton_Previews: PreviewProvider {
    static var previews: some View {
        StartProcessingButton(title: "Compress Video")
    }
}
