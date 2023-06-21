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
//                print("Downloaded data from : \(url)")
                
                let json = String(data: output.data, encoding: String.Encoding.utf8)
//                let model = try? JSONDecoder().decode(CoinDetailsModel.self, from: output.data)
//                print("Model is : \(model)")
                
//                print("Output data : \(json)")
                return output.data
            }
//            .receive(on: DispatchQueue.main) // here app will switch to main thread instead of background thread
            .eraseToAnyPublisher()
    }
    
    static func completionHandler(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            print("Completion is finished")
            break
        case .failure(let error):
            print("Error found! Error is : \(error.localizedDescription)")
            return
        }
        
    }
    
}
