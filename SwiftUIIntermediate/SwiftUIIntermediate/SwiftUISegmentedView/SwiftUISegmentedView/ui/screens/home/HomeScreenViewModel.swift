//
//  HomeScreenViewModel.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/15/23.
//

import SwiftUI
import PhotosUI

class HomeScreenViewModel : ObservableObject{
    
    @Published var selectedVideos : [PhotosPickerItem] = []
    
    func handleSelectedVideos(selectedItems : [PhotosPickerItem]) {
        print("Selected Videos \(selectedItems)")
    }
    
}
