//
//  VideoPickerScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/19/23.
//

import SwiftUI

struct VideoPickerScreen: View {
    
    @StateObject private var videoLibraryService = VideoLibraryService()
    @StateObject private var viewModel = VideoPickerViewModel()
    let purpose : Int
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigation : Navigation
    
    let gridItems : [GridItem] = [
        GridItem(.flexible(),alignment: .leading),
        GridItem(.flexible(),alignment: .leading),
        GridItem(.flexible(),alignment: .leading)
    ]
    
    var body: some View {
        
        VStack{
            NavbarWithBackButton(title: "Pick Video")
            
            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(videoLibraryService.videoFiles, content: { videoFile in
                        
                        VideoPickerItemView(videoFile: videoFile, clickCallback: videoFileClicked)
                            .onTapGesture {
                                videoFileClicked(videoFile: videoFile)
                            }
                        
                    })
                })
                .onAppear{
                    videoLibraryService.fetchAllVideos()
                }
            }.navigationBarBackButtonHidden()
            
            Spacer()
            
            if viewModel.hasSelectedVideos() {
                SelectionButtonView
            }
            
            
            
        }
//        .edgesIgnoringSafeArea(.bottom)
        
        
    }
    
    private func videoFileClicked(videoFile : VideoFile) {
        videoFile.toggleSelection()
        viewModel.updateVideoFileSelectin(videoFile: videoFile)
    }
    
    private var SelectionButtonView : some View {
        return HStack {
            Image(systemName: "xmark")
                .padding(.leading, 8)
                .onTapGesture {
                    clearSelectedVideoList()
                    
                }
            
            Text(viewModel.totalSelectionText)
            
            Spacer()
            
            NavigationLink(destination : getNextScreenView()) {
                HStack {
                    Text("Next")
                    Image(systemName: "arrow.right")
                }
            }
            .isDetailLink(true)
            .simultaneousGesture(TapGesture().onEnded {
                print("Leaving Screen")
                viewModel.cacheSelectedVideoList()
                navigation.clearPath()
            })
            
        }
        .foregroundColor(.white)
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(
            Rectangle()
                .fill(Color.primaryColor)
        )
    }
    
    private func getNextScreenView() -> some View {
        switch purpose {
        case Values.FAST_COMPRESSION :
            return FastCompressionView()
        default:
            return FastCompressionView()
        }
    }
    
    private func moveToNextScreenWithSelectedVideos() {
        print("moveToNextScreenWithSelectedVideos")
        
    }
    
    private func clearSelectedVideoList() {
        viewModel.clearSelectedVideos()
    }
}

struct VideoPickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        VideoPickerScreen(purpose: Values.NONE)
    }
}
