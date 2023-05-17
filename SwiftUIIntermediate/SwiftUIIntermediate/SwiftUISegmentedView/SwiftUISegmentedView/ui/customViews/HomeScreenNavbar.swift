//
//  HomeScreenNavbar.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct HomeScreenNavbar: View {
    var body: some View {
        HStack{
            
            Image(systemName: "line.3.horizontal.decrease")
                .foregroundColor(.white)
                .font(.title3)
            
            Spacer()
            
            Text("Video Compressor")
                .foregroundColor(.white)
                .font(.title3)
            
            Spacer()
            
        }
        .padding()
        .background(Color.toolbarBG)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

struct HomeScreenNavbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenNavbar()
    }
}
