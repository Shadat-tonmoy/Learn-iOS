//
//  DownloadDataViewModel.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

class DownloadDataViewModel : ObservableObject {
    
    @Published var postModel : [PostModel]? = nil
    
    
    init() {
        print("Init Called!!")
        getPosts()
        
    }
    
    
    func getPosts() {
//        let apiUrl = "https://jsonplaceholder.typicode.com/posts/1"
        let apiUrl = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, urlResponse, error) in
            
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard error == nil else {
                print("Error : \(String(describing: error))")
                return
            }
            
            guard let urlResponse = urlResponse as? HTTPURLResponse else {
                print("Invalid url response")
                return
            }
            
            guard urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else {
                print("Response status code should be 2xx but it is \(urlResponse.statusCode)")
                return
            }
            
            print("Successfully Downloaded!")
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            var decodedData : [PostModel]? = DataConverter.decodeData(rawData: data)
            print(decodedData)
            DispatchQueue.main.async { [weak self] in
                self?.postModel = decodedData
            }
            
        }).resume()
    }
    
    
}
