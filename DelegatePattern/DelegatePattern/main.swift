//
//  main.swift
//  DelegatePattern
//
//  Created by Shadat Tonmoy on 3/9/23.
//

import Foundation

print("Hello, World!")

protocol DownloadProtocol {
    
    func downloadDidStarted()
    
    func downloadInProgress()
    
    func downloadDidCompleted()
}

struct DownloadTask {
    
    var downloadProtocol : DownloadProtocol?
    
    func notifyDownloadStarted() {
        downloadProtocol?.downloadDidStarted()
    }
    
    func notifyDownloadProgress() {
        downloadProtocol?.downloadInProgress()
    }
    
    func notifyDownloadCompleted() {
        downloadProtocol?.downloadDidCompleted()
    }
    
}

struct DownloadScreen : DownloadProtocol{
    
    var downloadTask : DownloadTask?
    
    init() {
        self.downloadTask = DownloadTask()
        downloadTask?.downloadProtocol = self
    }
    
    func downloadDidStarted() {
        <#code#>
    }
    
    func downloadInProgress() {
        <#code#>
    }
    
    func downloadDidCompleted() {
        <#code#>
    }
    
    
}

