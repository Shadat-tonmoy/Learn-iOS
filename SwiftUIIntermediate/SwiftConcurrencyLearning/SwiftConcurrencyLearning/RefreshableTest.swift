//
//  RefreshableTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 8/1/23.
//

import SwiftUI

class RefreshableDataManager {
    
    func getData() async -> [String] {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let data = ["Apple", "Orange", "Banana"]
        return data.shuffled()
    }
}

class RefreshableViewModel : ObservableObject {
    
    @Published var data : [String] = []
    private var dataManager = RefreshableDataManager()
    
    func getData() async {
        
        data = await dataManager.getData()
    }
    
}

struct RefreshableTest: View {
    
    @StateObject private var viewModel = RefreshableViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.data, id: \.self, content: { data in
                        Text(data)
                    })
                }
            }
            .navigationTitle("Refresable")
            .refreshable {
                await viewModel.getData()
            }
            .task {
                await viewModel.getData()
            }
        }
    }
}

struct RefreshableTest_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableTest()
    }
}
