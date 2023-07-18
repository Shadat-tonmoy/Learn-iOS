//
//  DownloadImageAsync.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/16/23.
//

import SwiftUI
import Combine

class DownloadImageAsyncLoader {
    
    let url = URL(string: "https://picsum.photos/200")!
    
    func downloadWithEscaping( completionHandler : @escaping (_ image : UIImage?, _ error : Error?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            guard
                let data = data,
                let image = UIImage(data: data),
                let httpResponse = urlResponse as? HTTPURLResponse,
                httpResponse.statusCode >= 200 && httpResponse.statusCode < 300
            else {
                completionHandler(nil, error)
                return
            }
            
            completionHandler(image, nil)
            
        }.resume()
    }
    
    func fetchImageWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data: Data, response: URLResponse) -> UIImage? in
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode >= 200 && httpResponse.statusCode < 300
                else {
                    return nil
                }
                
                return UIImage(data: data)
                
            }
            .mapError({ $0 })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}


class DownloadImageAsyncViewModel : ObservableObject {
    
    @Published var image : UIImage? = nil
    var cancellables = Set<AnyCancellable>()
    
    let imageDownloadManager = DownloadImageAsyncLoader()
    
    func fetchImage() {
        self.image = UIImage(systemName: "apple.logo")
    }
    
    func fetchImageWithEscaping() {
        imageDownloadManager.downloadWithEscaping { [weak self] image, error in
            if let downloadedImage = image {
                DispatchQueue.main.async {
                    print("Image Downloaded")
                    self?.image = downloadedImage
                }
            } else if let error = error {
                print("Error in downloading image. Error : \(error)")
                
            }
            
        }
    }
    
    func fetchImageWithCombine() {
        imageDownloadManager
            .fetchImageWithCombine()
            .sink { result in
                
            } receiveValue: { [weak self] uiImage in
                self?.image = uiImage
            }
            .store(in: &cancellables)
    }
}

struct DownloadImageAsync: View {
    
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                ProgressView()
            }
        }
        .onAppear{
            viewModel.fetchImageWithCombine()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
