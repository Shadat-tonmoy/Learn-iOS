//
//  CheckedContinuationTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/24/23.
//

import SwiftUI

class CheckedContinuationViewModel : ObservableObject {
    
    @Published var uiImage : UIImage? = nil
    let urlString = "https://picsum.photos/1000"
    
    
    
    func fetchImage() async {
        var url = URL(string: urlString)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run{
                uiImage = UIImage(data: data)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async throws -> Data {
        let url = URL(string: urlString)!
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
            
        }
    }
    
    func fetchImageWithContinuation() async {
        
        do {
            let data = try await fetchImage2()
            uiImage = UIImage(data: data)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    
}

struct CheckedContinuationTest: View {
    
    @StateObject private var viewModel : CheckedContinuationViewModel = CheckedContinuationViewModel()
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            if let image = viewModel.uiImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            }
        }
        .task {
            await viewModel.fetchImageWithContinuation()
        }
    }
        
}

struct CheckedContinuationTest_Previews: PreviewProvider {
    static var previews: some View {
        CheckedContinuationTest()
    }
}
