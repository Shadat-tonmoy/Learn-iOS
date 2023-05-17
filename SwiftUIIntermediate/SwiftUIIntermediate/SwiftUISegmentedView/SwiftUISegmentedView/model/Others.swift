//
//  Others.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import Foundation


struct SocialMediaOption : Identifiable, Hashable{
    
    let id : Int
    let title : String
    let icon : String
    var isSelected : Bool
    
    mutating func toggleSelection() {
        isSelected.toggle()
    }
}
