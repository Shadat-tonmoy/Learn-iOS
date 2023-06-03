//
//  CommonFileSizeRepo.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import Foundation


class CommonFileSizeRepo{
    
    static let options : [CommonFileSize] = [
        CommonFileSize(id: IDs.COMMON_FILE_SIZE_WHATSAPP, title: "WhatsApp - 16 MB", valueInMB: 16),
        CommonFileSize(id: IDs.COMMON_FILE_SIZE_GMAIL, title: "Gmail/Yahoo/AOL - 25 MB", valueInMB: 25),
        CommonFileSize(id: IDs.COMMON_FILE_SIZE_HOTMAIL, title: "Outlook/Hotmail - 10 MB", valueInMB: 10),
        CommonFileSize(id: IDs.COMMON_FILE_SIZE_GMX, title: "GMX - 50 MB", valueInMB: 50)
    ]
    
}
