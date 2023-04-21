//
//  JSONDecoderExtension.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/21/23.
//

import Foundation

extension Bundle {
    
    func decode<T : Codable>(fileName : String) -> T{
        
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate file with \(fileName)")
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("Failed to decode data of \(fileUrl)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data")
        }
        
        return decodedData
        
                
                
                
        
    }
}
