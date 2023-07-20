//
//  TaskTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 7/19/23.
//

import SwiftUI


class TaskTestViewModel : ObservableObject {
    
    @Published var images : [UIImage] = []
    let urlString = "https://picsum.photos/1000"
    
    func fetchImage() async {
        
        guard
            let url = URL(string: urlString) else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                images.append(image)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

struct TaskTest: View {
    
    @StateObject var viewModel = TaskTestViewModel()
    let gridItems : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        VStack {
            LazyVGrid(columns: gridItems, spacing: 10, content: {
                ForEach(viewModel.images, id : \.self, content: { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                })
            })
            Spacer()
        }
        .task {
            await viewModel.fetchImage()
        }
        .task {
            await viewModel.fetchImage()
        }
        .task {
            await viewModel.fetchImage()
        }
    }
}

struct TaskTest_Previews: PreviewProvider {
    static var previews: some View {
        TaskTest()
    }
}
