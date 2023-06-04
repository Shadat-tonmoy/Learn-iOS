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

class DummyFiles {
    static let videoFile = VideoFile(id: "", title: "Test Video", width: 124, height: 124, duration: 123, createdAt: 123, modifiedAt: 123, fileSize: 123)
}
