//
//  HomeScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/10/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HomeScreenNavbar()
                
                
                NavigationLink(destination: FastCompressionView()) {
                    VStack{
                        Image(systemName: "slider.horizontal.3")
                            .font(.title)
                            .foregroundColor(AppColors.toolbarBG)
                        
                        Text("Fast Compression")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    
                }
                
                
                
                Spacer()
            }
            
            
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
