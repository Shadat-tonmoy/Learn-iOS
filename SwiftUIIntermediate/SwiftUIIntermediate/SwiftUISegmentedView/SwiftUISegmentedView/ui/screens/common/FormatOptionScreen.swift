//
//  FormatOptionScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct FormatOptionScreen: View {
    var body: some View {
        VStack(alignment : .leading) {
            Text("Choose Preferred Format")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top,15)
            List(VideoFormatOptionRepo.getOptions(), rowContent: { option in
                Text(option.title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                
            })
            .listStyle(PlainListStyle())
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,5)
    }
}

struct FormatOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormatOptionScreen()
    }
}
