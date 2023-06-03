//
//  Utils.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import Foundation


class Utils {
    
    static func getHumanRedableFileSize(_ bytes:Int64) -> String {
        let formatter:ByteCountFormatter = ByteCountFormatter()
        formatter.countStyle = .binary
        
        return formatter.string(fromByteCount: Int64(bytes))
    }
}
