//
//  SocialMediaOptionRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/17/23.
//

import Foundation


class SocialMediaOptionRepo{
    
    private static let options : [SocialMediaOption] = [
        SocialMediaOption(id: IDs.SOCIAL_MEDIA_WHATSAPP, title: "WhatsApp", icon: "whatsapp", isSelected: false),
        SocialMediaOption(id: IDs.SOCIAL_MEDIA_MESSENGER, title: "Messenger", icon: "messenger", isSelected: false),
        SocialMediaOption(id: IDs.SOCIAL_MEDIA_INSTAGRAM, title: "Instagram", icon: "instagram", isSelected: false),
        SocialMediaOption(id: IDs.SOCIAL_MEDIA_GMAIL, title: "Gmail", icon: "gmail", isSelected: false),
    ]
    
    static func getOptions() -> [SocialMediaOption] {
        return options
    }
    
    static func getDefaultOption() -> SocialMediaOption {
        return options[0]
    }
    
    static func updateSelectedOption(selectedOption : SocialMediaOption){
        options.forEach{ option in
            option.isSelected = option.id == selectedOption.id
            print("Setting flag as : \(option.isSelected) for : \(option.title)")
        }
    }
    
    static func selectNone(){
        options.forEach{ option in
            option.isSelected = false
        }
    }
    
}
