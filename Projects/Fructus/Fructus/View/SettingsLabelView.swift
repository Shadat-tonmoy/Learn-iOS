//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct SettingsLabelView: View {
    let labelText : String
    let labelImage : String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Frutus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
