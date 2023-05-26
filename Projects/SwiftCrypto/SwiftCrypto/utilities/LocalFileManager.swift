//
//  LocalFileManager.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/26/23.
//

import SwiftUI


class LocalFileManager {
    
    static let instance : LocalFileManager = LocalFileManager()
    
    private init(){}
    
    func saveImage(image : UIImage, fileName : String, folderName : String){
        
        createFolderIfNeeded(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getUrlForImageFile(fileName: fileName, folderName: folderName)
        else {
            return
        }
        
        do {
            try data.write(to: url)
            print("Image cached successfully at : \(url)")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func getUrlForFolder(folderName : String) -> URL? {
        guard
            let cacheDirUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return cacheDirUrl.appendingPathComponent(folderName, conformingTo: .folder)
                
    }
    
    private func getUrlForImageFile(fileName : String, folderName : String) -> URL? {
        
        guard
            let folderUrl = getUrlForFolder(folderName: folderName)
        else {
            return nil
        }
        
        let fileUrl = folderUrl.appendingPathComponent("\(fileName).png", conformingTo: .fileURL)
                
        
        if !FileManager.default.fileExists(atPath: fileUrl.path()){
            let result = FileManager.default.createFile(atPath: fileUrl.path(), contents: nil)
            print("File Creation Result : \(result) for : \(fileUrl.path())")
        }
        
        
        return fileUrl
    }
    
    private func createFolderIfNeeded(folderName : String) {
        guard
            let folderUrl = getUrlForFolder(folderName: folderName) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: folderUrl.path()) {
            
            do {
                try FileManager.default.createDirectory(at: folderUrl, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating folder \(folderName). Error is : \(error.localizedDescription)")
            }
            
            
        }
    }
    
    
    func getImageFromFileManager(fileName : String, folderName : String) -> UIImage? {
        guard
            let imageUrl = getUrlForImageFile(fileName: fileName, folderName: folderName),
            FileManager.default.fileExists(atPath: imageUrl.path()) else {
            return nil
        }
        
        return UIImage(contentsOfFile: imageUrl.path())
    }
    
}
