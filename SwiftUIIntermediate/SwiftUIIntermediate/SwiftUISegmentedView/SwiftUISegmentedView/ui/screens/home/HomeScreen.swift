//
//  HomeScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/10/23.
//

import SwiftUI
import PhotosUI

struct HomeScreen: View {
    
    @StateObject var viewModel : HomeScreenViewModel = HomeScreenViewModel()
    @StateObject var videoLibrary : VideoLibraryService = VideoLibraryService()
    
    init(){
        videoLibrary.requestAuthorization()
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                
                HomeScreenNavbar()
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        HomeScreenSectionHeader(title: "Compress Video")
                        
                        HStack(spacing : 20){
                            NavigationLink(destination : FastCompressionView()){
                                HomeScreenIcon(
                                    iconName: "slider.horizontal.3",
                                    title: "Fast\nCompresion"
                                )
                                
                            }
                            
                            NavigationLink(destination : VideoPickerScreen()){
                                HomeScreenIcon(
                                    iconName: "slider.horizontal.3",
                                    title: "Advance\nCompresion"
                                )
                                
                            }
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Convert Video")
                        
                        HStack(spacing : 20){
                            
                            HomeScreenVideoPickerItem(
                                iconName: "slider.horizontal.3",
                                title: "Convert Format",
                                selectedVideos: $viewModel.selectedVideos,
                                selectionCallback: viewModel.handleSelectedVideos
                            )
                            
                            HomeScreenVideoPickerItem(
                                iconName: "slider.horizontal.3",
                                title: "Video to Audio",
                                selectedVideos: $viewModel.selectedVideos,
                                selectionCallback: viewModel.handleSelectedVideos
                            )
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Process Video")
                        
                        HStack(spacing : 20){
                            HomeScreenVideoPickerItem(
                                iconName: "slider.horizontal.3",
                                title: "Trim Video",
                                selectedVideos: $viewModel.selectedVideos,
                                selectionCallback: viewModel.handleSelectedVideos
                            )
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
