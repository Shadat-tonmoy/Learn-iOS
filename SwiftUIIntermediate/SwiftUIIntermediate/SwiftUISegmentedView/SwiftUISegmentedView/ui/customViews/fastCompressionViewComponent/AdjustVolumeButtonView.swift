//
//  AdjustVolumeButtonView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/18/23.
//

import SwiftUI

struct AdjustVolumeButtonView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Adjust Volume")
                .font(.headline)
            Text("Increase/Decrease/Mute video volume.")
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

struct AdjustVolumeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustVolumeButtonView()
    }
}
