//
//  PlayerSliderItemView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import SwiftUI

struct PlayerSliderItemView: View {
    let player : Player
    
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
    }
}

struct PlayerSliderItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSliderItemView(player: playerList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
