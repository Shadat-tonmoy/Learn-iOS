//
//  AsyncLetTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/20/23.
//

import SwiftUI

class AsyncLetViewModel : ObservableObject {
    
    @Published var images : [UIImage] = []
    let urlString = "https://picsum.photos/1000"
    
    func fetchImage() async {
        
        guard
            let url = URL(string: urlString)
        else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let imageFromData = UIImage(data: data) {
                images.append(imageFromData)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchImageAsync() async -> UIImage? {
        
        guard
            let url = URL(string: urlString)
        else {
            return nil
//            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let imageFromData = UIImage(data: data) {
                return imageFromData
            }
//            throw URLError(.badServerResponse)
            
        } catch let error {
            print(error.localizedDescription)
//            throw error
        }
        return nil
        
    }
    
    func fetchRecentImages() async {
        
        do {
            try await fetchImagesWithTaskGroup()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchImagesWithTaskGroup() async throws {
        
//        var images : [UIImage] = []
        
        try await withThrowingTaskGroup(of: UIImage?.self) { taskGroup in
            
            for _ in 1...10 {
                taskGroup.addTask{
                    await self.fetchImageAsync()
                }
            }
            
            for try await image in taskGroup {
                if let downloadedImage = image {
                    self.images.append(downloadedImage)
                }
                
            }
            
            
        }
        
//        return images
        
        
        
    }
    
}

struct AsyncLetTest: View {
    
    @StateObject private var viewModel : AsyncLetViewModel = AsyncLetViewModel()
    private let gridItems : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(viewModel.images, id: \.self, content: { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    })
                })
            }
        }
        .task {
//            await viewModel.fetchImage()
            await viewModel.fetchRecentImages()
//            await viewModel.fetchImagesWithTaskGroup()
        }
    }
}

struct AsyncLetTest_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLetTest()
    }
}
