//
//  NetworkManager.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/25/23.
//

import SwiftUI
import Combine


class NetworkManager{
    
    static func download(url : URL) -> AnyPublisher<Data, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap{ (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error response code : \(output.response)")
                    return output.data
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func completionHandler(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            print("Completion is finished")
            break
        case .failure(let error):
            print(error.localizedDescription)
            return
        }
        
    }
    
}
