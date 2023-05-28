//
//  Others.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import Foundation


class SocialMediaOption : Identifiable {
    
    let id : Int
    let title : String
    let icon : String
    var isSelected : Bool
    
    init(id: Int, title: String, icon: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.icon = icon
        self.isSelected = isSelected
    }
    
    func toggleSelection() {
        isSelected.toggle()
    }
}

class ResolutionCompressionOption : Identifiable {
    
    let id : Int
    let title : String
    let subtitle : String
    var isSelected : Bool
    
    init(id: Int, title: String, subtitle: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
    }
    
    func toggleSelection() {
        isSelected.toggle()
    }
}
