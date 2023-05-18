//
//  TrimVideoButtonView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/18/23.
//

import SwiftUI

struct TrimVideoButtonView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Trim Video")
                .font(.headline)
            Text("Reduce video file size further by removing unwanted part")
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        .padding(.horizontal, 10)
        .background(getCardBackground())
        .padding(.horizontal,10)
        .padding(.top,10)
    }
}

struct TrimVideoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TrimVideoButtonView()
    }
}
