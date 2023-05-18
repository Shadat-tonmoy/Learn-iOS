//
//  SocialMediaOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import Foundation


class SocialMediaOptionRepo{
    
    private static let options : [SocialMediaOption] = [
        SocialMediaOption(id: 1, title: "WhatsApp", icon: "whatsapp", isSelected: false),
        SocialMediaOption(id: 2, title: "Messenger", icon: "messenger", isSelected: false),
        SocialMediaOption(id: 3, title: "Instagram", icon: "instagram", isSelected: false),
        SocialMediaOption(id: 4, title: "Gmail", icon: "gmail", isSelected: false),
    ]
    
    static func getOptions() -> [SocialMediaOption] {
        return options
    }
    
}
