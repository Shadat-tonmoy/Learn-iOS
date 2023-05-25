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
                guard let respose = output.response as? HTTPURLResponse,
                      respose.statusCode >= 200 && respose.statusCode < 300 else {
                    print("Error response code")
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
