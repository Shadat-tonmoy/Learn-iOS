//
//  DownloadDataWithCombineViewModel.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

class DownloadDataWithCombineViewModel : ObservableObject {
    
    @Published var postList : [PostModel] = []
    @Published var isFetchingData = false
    
    init(){
        isFetchingData = true
        getPosts()
    }
    
    func getPosts(){
        
        let apiUrl = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string : apiUrl) else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleData)            
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                print("Completion : \(completion)")
                self?.isFetchingData = false
            }, receiveValue: { [weak self] posts in
                self?.postList = posts
            })
        
        
        
    }
    
    private func handleData(output : URLSession.DataTaskPublisher.Output) throws -> Data{
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    
}
