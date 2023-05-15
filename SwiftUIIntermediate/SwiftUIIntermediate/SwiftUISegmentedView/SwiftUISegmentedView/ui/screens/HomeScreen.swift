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
            VStack(alignment: .leading, spacing: 0) {
                
                HomeScreenNavbar()
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        HomeScreenSectionHeader(title: "Compress Video")
                        
                        HStack(spacing : 20){
                            NavigationLink(destination: FastCompressionView()) {
                                HomeScreenIcon(iconName: "slider.horizontal.3", title: "Fast\nCompression")
                                
                            }
                            
                            NavigationLink(destination: FastCompressionView()) {
                                HomeScreenIcon(iconName: "slider.horizontal.3", title: "Advance\nCompression")
                                
                            }
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Convert Video")
                        
                        HStack(spacing : 20){
                            NavigationLink(destination: FastCompressionView()) {
                                HomeScreenIcon(iconName: "slider.horizontal.3", title: "Convert Format")
                                
                            }
                            
                            NavigationLink(destination: FastCompressionView()) {
                                HomeScreenIcon(iconName: "slider.horizontal.3", title: "Video to Audio")
                                
                            }
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Process Video")
                        
                        HStack(spacing : 20){
                            NavigationLink(destination: FastCompressionView()) {
                                HomeScreenIcon(iconName: "slider.horizontal.3", title: "Trim Video")
                            }
                        }
                        .padding()
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
