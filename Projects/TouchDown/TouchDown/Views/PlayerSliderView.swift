//
//  PlayerSliderView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct PlayerSliderView: View {
    var body: some View {
        Group {
            TabView{
                ForEach(playerList, id: \.self, content: { player in
                    PlayerSliderItemView(player: player)
                })
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding()
        }.frame(height: 250)
    }
}

struct PlayerSliderView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSliderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
