//
//  DataConverter.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

class DataConverter{
    
    static func decodeData<T : Codable> (rawData : Data) -> T?{
        
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(T.self, from: rawData) else {
            print("Failed to decode data!")
            return nil
        }
        return decodedData
    }
    
}
