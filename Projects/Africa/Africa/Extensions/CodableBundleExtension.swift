//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import Foundation

extension Bundle {
    func decode(_ file : String) -> [CoverModel] {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let coverModel = try? decoder.decode([CoverModel].self, from: data) else {
            fatalError("Failed to decode data from \(file)")
        }
        
        return coverModel
        
    }
}
