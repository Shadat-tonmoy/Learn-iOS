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
    @StateObject var navigation : Navigation = Navigation()
    
    var body: some View {
        NavigationStack(path : $navigation.paths) {
            VStack(alignment: .leading, spacing: 0) {
                
                HomeScreenNavbar()
                
                ScrollView(.vertical) {
                    
                    VStack(alignment: .leading) {
                        HomeScreenSectionHeader(title: "Compress Video")
                        
                        HStack(spacing : 20){
                            
                            NavigationLink(value : Values.FAST_COMPRESSION){
                                HomeScreenIcon(
                                    iconName: "fastCompression",
                                    title: "Fast\nCompresion"
                                )
                                
                            }.onTapGesture {
                                navigateToVideoPicker(purpose: Values.FAST_COMPRESSION)
                            }
                            
                            NavigationLink(value : Values.ADVANCE_COMPRESSION){
                                HomeScreenIcon(
                                    iconName: "advanceCompression",
                                    title: "Advance\nCompresion"
                                )
                                
                            }.onTapGesture {
                                navigateToVideoPicker(purpose: Values.ADVANCE_COMPRESSION)
                            }
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Convert Video")
                        
                        HStack(spacing : 20){
                            
                            NavigationLink(value : Values.CONVERT_FORMAT){
                                HomeScreenIcon(
                                    iconName: "convertFormat",
                                    title: "Convert Format"
                                )
                                
                            }.onTapGesture {
                                navigateToVideoPicker(purpose: Values.CONVERT_FORMAT)
                            }
                            
                            NavigationLink(value : Values.VIDEO_TO_AUDIO){
                                HomeScreenIcon(
                                    iconName: "videoToAudio",
                                    title: "Video to Audio"
                                )
                            }.onTapGesture {
                                navigateToVideoPicker(purpose: Values.VIDEO_TO_AUDIO)
                            }
                        }
                        .padding()
                        
                        HomeScreenSectionHeader(title: "Process Video")
                        
                        HStack(spacing : 20){
                            
                            NavigationLink(value : Values.TRIM_VIDEO){
                                HomeScreenIcon(
                                    iconName: "trimVideo",
                                    title: "Trim Video"
                                )
                            }.onTapGesture {
                                navigateToVideoPicker(purpose: Values.TRIM_VIDEO)
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
            .navigationDestination(for: Int.self, destination: { value in
                VideoPickerScreen(purpose: value)
            })
        }
        .environmentObject(navigation)
    }
    
    private func navigateToVideoPicker(purpose : Int){
        navigation.addPath(pathValue: purpose)
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
