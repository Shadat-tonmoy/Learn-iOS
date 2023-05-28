//
//  SpeedOptionScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct SpeedOptionScreen: View {
    var body: some View {
        
        VStack(alignment : .leading) {
            Text("Choose Preferred Speed")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top,15)
            List(ProcessingSpeedOptionRepo.getOptions(), rowContent: { option in
                Text(option.title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                
            })
            .listStyle(PlainListStyle())
            
        }
        .presentationDetents([.fraction(0.25)])
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal,5)
    }
}

struct SpeedOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpeedOptionScreen()
    }
}
